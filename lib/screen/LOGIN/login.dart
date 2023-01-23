import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/LOGIN/login_metiz.dart';
import 'package:metiz_cinema/screen/LOGIN/register.dart';
import 'package:metiz_cinema/screen/about.dart';
import 'package:metiz_cinema/screen/LOGIN/login_fb.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AppBarHome())), icon: Icon(Icons.arrow_back)),
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
            SizedBox(height: 30,),
            Column(
              children: [
                Container(
                  width: 330,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_Metiz())),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "TÀI KHOẢN METIZ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_FB())),
                        color: Colors.blue,
                        minWidth: 330,
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child:  ElevatedButton(onPressed: (){
                          _facebookLogin();

                          setState(() {

                          });
                        }, child: Text(
                          "TÀI KHOẢN FACEBOOK",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        ),
                      ),
                    ],
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
                    Text('Bạn chưa có tài khoản?', style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Text(
                        "Đăng ký TÀI KHOẢN",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange
                        ),
                      ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Register()));
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      ),
    );
  }
  _facebookLogin() async {
    // Create an instance of FacebookLogin
    final fb = FacebookLogin();

// Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile, //permission to get public profile
      FacebookPermission.email, // permission to get email address
    ]);
    // Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
      // Logged in

      // Send access token to server for validation and auth
        final FacebookAccessToken? accessToken = res.accessToken; // get accessToken for auth login
        final profile = await fb.getUserProfile(); // get frofile user
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        final email = await fb.getUserEmail();

        print('Access token: ${accessToken?.token}');
        print('Hello, ${profile!.name}! You ID: ${profile.userId}');
        print('Your profile image: $imageUrl');

        // But user can decline permission
        if (email != null)
          print('And your email is $email');

        break;
      case FacebookLoginStatus.cancel:
      // User cancel log in
        break;
      case FacebookLoginStatus.error:
      // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }
  }
}
