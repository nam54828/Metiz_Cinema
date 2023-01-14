import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/LOGIN/login.dart';

class Login_Metiz extends StatefulWidget {
  const Login_Metiz({Key? key}) : super(key: key);

  @override
  State<Login_Metiz> createState() => _Login_MetizState();
}

class _Login_MetizState extends State<Login_Metiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())), icon: Icon(Icons.arrow_back)),
        title: Text("ĐĂNG NHẬP", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(

        ),
      ),
    );
  }
}
