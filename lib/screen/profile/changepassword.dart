import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metiz_cinema/screen/profile/profile.dart';

import '../../components/app_bar_home.dart';

class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);

  @override
  State<changePassword> createState() => _changePasswordState();
}
class _changePasswordState extends State<changePassword> {

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final dbRef = FirebaseDatabase.instance.reference().child("users");
  bool _isUpdatingPassword = false;
  String? _errorMessage;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (_newPasswordController.text != _confirmNewPasswordController.text) {
      setState(() {
        _isUpdatingPassword = false;
        _errorMessage = 'Mật khẩu mới và mật khẩu nhập lại không khớp!';
      });
      return;
    }

    setState(() {
      _isUpdatingPassword = true;
    });

    try {
      User user = _auth.currentUser!;
      await user.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: user.email!,
          password: _oldPasswordController.text,
        ),
      );
      await user.updatePassword(_newPasswordController.text);

      // Cập nhật mật khẩu trên Realtime Database
      String userId = user.uid;
      await dbRef.child(userId).update({'password': _newPasswordController.text});

      setState(() {
        _isUpdatingPassword = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Mật khẩu đã được cập nhật thành công!'),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      setState(() {
        _isUpdatingPassword = false;
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => profile())),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "THAY ĐỔI MẬT KHẨU",
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
                children: [
                  Container(
                      padding: EdgeInsets.only(top:20, bottom: 20),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: currentUser.currentUser?.photoURL != null
                            ? NetworkImage(currentUser.currentUser!.photoURL!)
                            : NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/2048px-Circle-icons-profile.svg.png"),
                      )
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Expanded(
                      child: StreamBuilder(
                        stream: FirebaseDatabase.instance.ref().child('users').child(currentUser.currentUser!.uid).child('fullname').onValue,
                        builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
                          if (snapshot.hasData) {
                            final fullname = snapshot.data?.snapshot.value?.toString() ?? '';
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
        Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _oldPasswordController,
                      decoration: InputDecoration(hintText: 'Mật khẩu cũ',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                          )),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập mật khẩu cũ!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _newPasswordController,
                      decoration: InputDecoration(hintText: 'Mật khẩu mới' ,
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                          )),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập mật khẩu mới!';
                        } else if (value.length < 6) {
                          return 'Mật khẩu mới phải chứa ít nhất 6 ký tự!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _confirmNewPasswordController,
                      decoration: InputDecoration(hintText: 'Nhập lại mật khẩu mới' ,
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                          )),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập lại mật khẩu mới!';
                        } else if (value.length < 6) {
                          return 'Mật khẩu mới phải chứa ít nhất 6 ký tự!';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
                onPressed: _isUpdatingPassword ? null : _onSubmit,
                color: Colors.orange,
                minWidth: 330,
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: _isUpdatingPassword
                    ? CircularProgressIndicator()
                    : Text(
                  'Lưu',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                )),
            if (_errorMessage != null)
              Text('Lỗi: $_errorMessage', style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            // display data from Firebase Realtime Database
          ],
        ),
          ],
        ),
      ),
    );
  }
}
