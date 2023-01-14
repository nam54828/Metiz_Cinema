import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/LOGIN/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Số CMND *",
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
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Chọn Thành Phố *",
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
                              hintText: "Chọn Quận/Huyện *",
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
                              hintText: "Địa Chỉ *",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10
                              )
                          ),
                          style: TextStyle(
                              color: Colors.white
                          ),
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
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppBarHome())),
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
