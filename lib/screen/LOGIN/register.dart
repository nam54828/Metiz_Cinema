import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/LOGIN/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
  final databaseRef = FirebaseDatabase.instance.reference();
  void showFaileMessage(){
    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
      title: const Text("Register"),
      content: Text("Failed"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context, "OK");
        }, child: Text("OK"))
      ],
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())), icon: Icon(Icons.arrow_back)),
        title: Text("ĐĂNG KÝ", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 30),
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
                              hintText: "Nhập mật khẩu *",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10
                              )
                          ),
                          style: TextStyle(
                              color: Colors.white
                          ),
                          controller: passwordController,
                          validator: (value){
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty){
                              return ("Vui lòng nhập mật khẩu");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Mật khẩu không hợp lệ");
                            }
                          },
                          onSaved: (value){
                            passwordController.text = value!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Nhập lại mật khẩu *",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10
                              )
                          ),
                          style: TextStyle(
                              color: Colors.white
                          ),
                        controller: confirmPasswordController,
                          validator: (value){
                            RegExp regex = RegExp(r'^.{6,}$');
                            if(value!.isEmpty){
                              return ("Vui lòng nhập lại mật khẩu");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Mật khẩu không hợp lệ");
                            }
                          },
                          onSaved: (value){
                            confirmPasswordController.text = value!;
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
                SizedBox(height: 15,),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 70),
                          width: 30,
                          child: Icon(Icons.square, color: Colors.orange,),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("Tôi đã đọc hiểu, và đồng ý với các",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              child: Text("Điều kiện & điều khoản",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                              ),
                              textAlign: TextAlign.left,),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text
                          ).then((value) {
                            databaseRef.child('users').child(value.user!.uid).set({
                              'fullname': fullnameController.text,
                              'birthday': birthdayController.text,
                              'email': emailController.text,
                              'cmnd': cmndController.text,
                              'phone': phoneController.text,
                              'password': passwordController.text,
                              'city': cityController.text,
                              'district': districtController.text,
                              'address': addressController.text,
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AppBarHome()));
                          }).onError((error, stackTrace) {
                            showFaileMessage();
                          });

                        },
                        color: Colors.orange,
                        minWidth: 330,
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "ĐĂNG KÝ",
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
      ),
    );
  }
}
