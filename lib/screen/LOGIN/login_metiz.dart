import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/LOGIN/login.dart';
import 'package:metiz_cinema/screen/LOGIN/register.dart';

class Login_Metiz extends StatefulWidget {
  const Login_Metiz({Key? key}) : super(key: key);

  @override
  State<Login_Metiz> createState() => _Login_MetizState();
}

class _Login_MetizState extends State<Login_Metiz> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void showFaileMessage(){
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Login"),
          content: Text("Login failed"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context, "OK");
            }, child: Text("OK"))
          ],
        )
    );
  }
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
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Image.asset('images/logo_metiz.png',
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Trường hợp này không được để trống.");
                          }
                          if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-z0-9A-Z.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Vui lòng nhập Email hợp lệ");
                          }
                          return null;
                        },
                        onSaved: (value) {
                          emailController.text = value!;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Mật khẩu *",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 10
                          )
                        ),
                        style: TextStyle(
                          color: Colors.white
                        ),
                        controller: passwordController,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Mật khẩu bắt buộc để đăng nhập");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Mật khẩu không hợp lệ");
                          }
                        },
                        onSaved: (value) {
                          passwordController.text = value!;
                        },
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      style:
                      ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: Center(
                          child: Text(
                            'ĐĂNG NHẬP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bạn chưa có tài khoản?",style: TextStyle(
                        color: Colors.white,
                        fontSize: 13
                      ),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Text("Đăng ký TÀI KHOẢN", style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Register()));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Text("QUÊN MẬT KHẨU", style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
