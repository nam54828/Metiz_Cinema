import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/profile/profile.dart';

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
                        Container(
                          padding: EdgeInsets.only(top:20, bottom: 20),
                          child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/2048px-Circle-icons-profile.svg.png", height: 80, width: 80,),
                        ),
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
                          TextFormField(
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
                          ),
                          TextFormField(
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
                          ),
                          TextFormField(
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
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Số CMND",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10
                                )
                            ),
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          TextFormField(
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
                          ),
                          TextFormField(
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
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Chọn Quận/Huyện",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10
                                )
                            ),
                            style: TextStyle(
                                color: Colors.white
                            ),
                            controller: districtController,
                            onSaved: (value){
                              districtController.text = value!;
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
                          onPressed: () {
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
}
