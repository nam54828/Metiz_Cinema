
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metiz_cinema/screen/LOGIN/login.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("QUÊN MẬT KHẨU", style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),),
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
        },
            icon: Icon(Icons.keyboard_backspace), color:  Colors.white,),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset("images/logo_metiz.png", height: 70,width: 70,),
                  SizedBox(
                    height: 15,
                  ),
                  Center(child: Text("Vui lòng điền địa chỉ email của bạn để được nhận mã \nxác nhận.",style: TextStyle(
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,)),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:  TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                          hintText: "Email *",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                          ),
                      ),
                      style: TextStyle(
                          color: Colors.white
                      ),
                      controller: emailController,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButtonTheme(
                    data: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                        ),
                          onPressed: () async{
                        var forgotEmail = emailController.text.trim();
                        try{
                          FirebaseAuth.instance.sendPasswordResetEmail(email: forgotEmail).then((value) => {
                            print("Email Sent!"),
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Login()))
                          });
                        }on FirebaseAuthException catch(e){
                          print("Error $e");
                        }
                      },
                          child: Text("GỬI MÃ XÁC NHẬN")),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}