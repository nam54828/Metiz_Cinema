import 'package:flutter/material.dart';

class Login_FB extends StatefulWidget {
  const Login_FB({Key? key}) : super(key: key);

  @override
  State<Login_FB> createState() => _Login_FBState();
}

class _Login_FBState extends State<Login_FB> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("login FaceBook"),
    );
  }
}
