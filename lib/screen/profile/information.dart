import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final userRef = FirebaseDatabase.instance
      .reference()
      .child('users')
      .child(currentUser.currentUser!.uid);
  PickedFile? _imageFile = null;
  final ImagePicker _picker = ImagePicker();

  Future<void> _uploadImage() async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('avatar/${auth.currentUser!.uid}');
    firebase_storage.UploadTask uploadTask =
        storageReference.putFile(File(_imageFile!.path));
    await uploadTask;
    print('File ${_imageFile!.path} uploaded successfully.');

    String downloadURL = await storageReference.getDownloadURL();
    await auth.currentUser!.updatePhotoURL(downloadURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => profile())),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "THÔNG TIN TÀI KHOẢN",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                    children: [imageProfile()],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Expanded(
                          child: StreamBuilder(
                            stream: FirebaseDatabase.instance
                                .ref()
                                .child('users')
                                .child(currentUser.currentUser!.uid)
                                .child('fullname')
                                .onValue,
                            builder: (BuildContext context,
                                AsyncSnapshot<DatabaseEvent> snapshot) {
                              if (snapshot.hasData) {
                                final fullname =
                                    snapshot.data?.snapshot.value?.toString() ??
                                        '';
                                return Center(
                                  child: Text(
                                    fullname,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Satoshi-Bold',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
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
                  StreamBuilder(
                    stream: userRef.onValue,
                    builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                      if (snapshot.hasData &&
                          snapshot.data!.snapshot.value != null) {
                        var data = snapshot.data!.snapshot.value;

                        return Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Họ & Tên *",
                                      hintStyle: TextStyle(
                                          color: Colors.white, fontSize: 10)),
                                  style: TextStyle(color: Colors.white),
                                  controller: TextEditingController()
                                    ..text = (data as Map)['fullname'] ?? "",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Vui lòng nhập họ và tên");
                                    }
                                  },
                                  onSaved: (value) {
                                    fullnameController.text = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Ngày Sinh *",
                                      hintStyle: TextStyle(
                                          color: Colors.white, fontSize: 10)),
                                  style: TextStyle(color: Colors.white),
                                  controller: TextEditingController()
                                    ..text = (data as Map)['birthday'] ?? "",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Vui lòng nhập ngày sinh");
                                    }
                                  },
                                  onSaved: (value) {
                                    birthdayController.text = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "CMND *",
                                      hintStyle: TextStyle(
                                          color: Colors.white, fontSize: 10)),
                                  style: TextStyle(color: Colors.white),
                                  controller: TextEditingController()
                                    ..text = (data as Map)['cmnd'] ?? "",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Vui lòng nhập số chứng minh nhân dân");
                                    }
                                  },
                                  onSaved: (value) {
                                    cmndController.text = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Số Điện Thoại *",
                                      hintStyle: TextStyle(
                                          color: Colors.white, fontSize: 10)),
                                  style: TextStyle(color: Colors.white),
                                  controller: TextEditingController()
                                    ..text = (data as Map)['phone'] ?? "",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Vui lòng nhập số điện thoại");
                                    }
                                  },
                                  onSaved: (value) {
                                    phoneController.text = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Chọn Thành Phố",
                                      hintStyle: TextStyle(
                                          color: Colors.white, fontSize: 10)),
                                  style: TextStyle(color: Colors.white),
                                  controller: TextEditingController()
                                    ..text = (data as Map)['city'] ?? "",
                                  onSaved: (value) {
                                    cityController.text = value!;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Địa Chỉ",
                                      hintStyle: TextStyle(
                                          color: Colors.white, fontSize: 10)),
                                  style: TextStyle(color: Colors.white),
                                  controller: TextEditingController()
                                    ..text = (data as Map)['district'] ?? "",
                                  onSaved: (value) {
                                    addressController.text = value!;
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              userRef.update({
                                'fullname': fullnameController.text,
                                'birthday': birthdayController.text,
                                'cmnd': cmndController.text,
                                'phone': phoneController.text,
                                'city': cityController.text,
                                'district': addressController.text,
                              }).then((value) {
                                // Nếu update thành công, hiển thị thông báo và refresh lại trang
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Thông tin của bạn đã được cập nhật")));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => information()));
                              }).catchError((error) {
                                // Nếu có lỗi xảy ra, hiển thị thông báo lỗi
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Có lỗi xảy ra, vui lòng thử lại sau")));
                              });
                            }
                          },
                          color: Colors.orange,
                          minWidth: 330,
                          height: 40,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'LƯU LẠI',
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

  Widget imageProfile() {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: CircleAvatar(
          radius: 40,
          backgroundImage: currentUser.currentUser?.photoURL != null
              ? NetworkImage(currentUser.currentUser!.photoURL!)
              : NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/2048px-Circle-icons-profile.svg.png"),
        ),
      ),
      Positioned(
        bottom: 20,
        right: 20,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
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
    ]);
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile photo",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text("Camera")),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.browse_gallery),
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
