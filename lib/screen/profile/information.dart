
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/profile/profile.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class information extends StatefulWidget {
  const information({Key? key}) : super(key: key);

  @override
  State<information> createState() => _informationState();
}

class _informationState extends State<information> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cmndController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

   PickedFile? _imageFile = null;
  final ImagePicker _picker = ImagePicker();

  Future<void> _uploadImage() async {
    firebase_storage.Reference storageReference =
    firebase_storage.FirebaseStorage.instance.ref().child('avatar/${auth.currentUser!.uid}');
    firebase_storage.UploadTask uploadTask =
    storageReference.putFile(File(_imageFile!.path));
    await uploadTask;
    print('File ${_imageFile!.path} uploaded successfully.');

    String downloadURL =
    await storageReference.getDownloadURL();
    await auth.currentUser!.updatePhotoURL(downloadURL);
  }
  Future<void> _updateUser() async {
    // get the user document ID
    String uid = auth.currentUser!.uid;
    // update the user information in Firestore
    await firestore.collection('user').doc(uid).update({
      // retrieve the text form fields values and update the corresponding Firestore fields
      'fullname': fullnameController.text.trim(),
      'birthday': birthdayController.text.trim(),
      'email': emailController.text.trim(),
      'cmnd': cmndController.text.trim(),
      'phone': phoneController.text.trim(),
      'city': cityController.text.trim(),
      'address': addressController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => profile())), icon: Icon(Icons.arrow_back)),
        title: Text("THÔNG TIN TÀI KHOẢN", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Container(
                height: 180,
                color: Colors.blueGrey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        imageProfile()
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child:  Expanded(
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("user")
                                  .where("uid",
                                  isEqualTo: currentUser.currentUser!.uid)
                                  .snapshots(),
                              builder:
                                  (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, i) {
                                      var data = snapshot.data!.docs[i];
                                      return InkWell(
                                        child: Center(
                                          child: Text(
                                            data['fullname'],
                                            style: TextStyle(
                                                color:
                                                Color.fromRGBO(255, 255, 255, 1),
                                                fontFamily: 'Satoshi-Bold',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("user")
                                .where("uid",
                                isEqualTo: currentUser.currentUser!.uid)
                                .snapshots(),
                            builder:
                                (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    var data = snapshot.data!.docs[i];
                                    return TextField(
                                      controller: TextEditingController()
                                      ..text = data["fullname"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Họ & Tên *",
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      )
                                  ),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  controller: fullnameController,
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return ("Vui lòng nhập họ và tên");
                                    }
                                  },
                                  onSaved: (value){
                                    fullnameController.text = value!;
                                  },
                                );
                              }
                            },
                          ),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("user")
                                .where("uid",
                                isEqualTo: currentUser.currentUser!.uid)
                                .snapshots(),
                            builder:
                                (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    var data = snapshot.data!.docs[i];
                                    return TextField(
                                      controller: TextEditingController()
                                        ..text = data["birthday"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Ngày Sinh *",
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      )
                                  ),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  controller: birthdayController,
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return ("Vui lòng nhập ngày sinh");
                                    }
                                  },
                                  onSaved: (value){
                                    birthdayController.text = value!;
                                  },
                                );
                              }
                            },
                          ),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("user")
                                .where("uid",
                                isEqualTo: currentUser.currentUser!.uid)
                                .snapshots(),
                            builder:
                                (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    var data = snapshot.data!.docs[i];
                                    return TextField(
                                      controller: TextEditingController()
                                        ..text = data["email"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Email *",
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      )
                                  ),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  controller: emailController,
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return ("Vui lòng nhập email");
                                    }
                                    if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-z0-9A-Z.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return ("Vui lòng nhập Email hợp lệ");
                                    }
                                    return null;
                                  },
                                  onSaved: (value){
                                    emailController.text = value!;
                                  },
                                );
                              }
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "CMND *",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10
                                )
                            ),
                            style: TextStyle(
                                color: Colors.white
                            ),
                            controller: cmndController,
                            validator: (value){
                              if (value!.isEmpty){
                                return ("Vui lòng nhập số chứng minh nhân dân");
                              }
                            },
                            onSaved: (value){
                              cmndController.text = value!;
                            },
                          ),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("user")
                                .where("uid",
                                isEqualTo: currentUser.currentUser!.uid)
                                .snapshots(),
                            builder:
                                (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    var data = snapshot.data!.docs[i];
                                    return TextField(
                                      controller: TextEditingController()
                                        ..text = data["phone"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return  TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Số Điện Thoại *",
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      )
                                  ),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  controller: phoneController,
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return ("Vui lòng nhập số điện thoại");
                                    }
                                  },
                                  onSaved: (value){
                                    phoneController.text = value!;
                                  },
                                );
                              }
                            },
                          ),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("user")
                                .where("uid",
                                isEqualTo: currentUser.currentUser!.uid)
                                .snapshots(),
                            builder:
                                (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    var data = snapshot.data!.docs[i];
                                    return TextField(
                                      controller: TextEditingController()
                                        ..text = data["city"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Chọn Thành Phố",
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      )
                                  ),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  controller: cityController,
                                  onSaved: (value){
                                    cityController.text = value!;
                                  },
                                );
                              }
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Địa Chỉ",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10
                                )
                            ),
                            style: TextStyle(
                                color: Colors.white
                            ),
                            controller: addressController,
                            onSaved: (value){
                              addressController.text = value!;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  // Container(
                  //   child: ElevatedButton(
                  //     onPressed: () async {
                  //       // final userData = UserModel(
                  //       //   email: emailController.text.trim(),
                  //       //   fullname: fullnameController.text.trim(),
                  //       //   birthday: birthdayController.text.trim(),
                  //       //   city: cityController.text.trim(),
                  //       //   cmnd: cmndController.text.trim(),
                  //       //   district: districtController.text.trim(),
                  //       //   password: passwordController.text.trim(),
                  //       //   phone: phoneController.text.trim()
                  //       // );
                  //       // await _update()
                  //     }, child: Text("Save"),
                  //   ),
                  // ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          onPressed: () async{
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              await _updateUser();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Thông tin của bạn đã được cập nhật"))
                              );
                            }
                          },
                          color: Colors.orange,
                          minWidth: 330,
                          height: 40,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            "LƯU LẠI",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget imageProfile(){
    return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.only(top:20, bottom: 20),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: currentUser.currentUser?.photoURL != null
                  ? NetworkImage(currentUser.currentUser!.photoURL!)
                  : NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/2048px-Circle-icons-profile.svg.png"),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28,
              ),
            ),
          )
        ]
    );
  }

  Widget bottomSheet(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text("Choose Profile photo", style: TextStyle(
            fontSize: 20
          ),),SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(onPressed: (){
                takePhoto(ImageSource.camera);
              }
                  , icon: Icon(Icons.camera),
                  label: Text("Camera")),
              FlatButton.icon(onPressed: (){
                takePhoto(ImageSource.gallery);
              }
                  , icon: Icon(Icons.browse_gallery),
                  label: Text("Gallery")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _uploadImage,
                child: Text('Upload Image'),
              ),
            ],
          )
        ],
      ),
    );
  }
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile!;
    });
  }
}
