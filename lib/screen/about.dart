import 'package:flutter/material.dart';
import 'package:metiz_cinema/screen/Content_about/about_introduce.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/Content_about/about_security.dart';
import 'package:metiz_cinema/screen/Content_about/about_setting.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AppBarHome())), icon: Icon(Icons.arrow_back)),
        title: Text("THÔNG TIN CHUNG", style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.purple,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 18),
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.person_outline,
                        color: Color.fromRGBO(6, 1, 180, 0.4),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin:
                          EdgeInsets.only(top: 20, right: 20),
                          child: Text(
                            "Giới thiệu",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: 'Satoshi-bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 210, top: 23),
                      child: IconButton(
                        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Introduce())),
                        icon: Icon(Icons.chevron_right, color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2,),
              Container(
                color: Colors.purple,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 18),
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.settings,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin:
                          EdgeInsets.only(top: 20, right: 20),
                          child: Text(
                            "Chính sách & điều khoản",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: 'Satoshi-bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 120, top: 23),
                      child: IconButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context) => aboutSetting())),
                        icon: Icon(Icons.chevron_right, color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2,),
              Container(
                color: Colors.purple,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 18),
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.security_rounded,
                        color: Colors.green,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin:
                          EdgeInsets.only(top: 20, right: 20),
                          child: Text(
                            "Chính sách bảo mật",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: 'Satoshi-bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 148, top: 23),
                      child: IconButton(
                        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => security())),
                        icon: Icon(Icons.chevron_right, color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2,),
              Container(
                color: Colors.purple,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 18),
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.question_answer,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin:
                          EdgeInsets.only(top: 20, right: 20),
                          child: Text(
                            "Câu hỏi thường gặp",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 140, top: 23),
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.chevron_right, color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2,),
              Container(
                color: Colors.purple,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 17),
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.phone,
                        color: Colors.yellow,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin:
                          EdgeInsets.only(top: 20, right: 20),
                          child: Text(
                            "Liên hệ",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: 'Satoshi-bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 220, top: 23),
                      child: IconButton(
                       onPressed: (){

                       },
                        icon: Icon(Icons.chevron_right, color: Colors.white,),
                      ),
                    ),
                    // Visibility(
                    //     visible: isVisible,
                    //     child: Container(
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Text("DỊCH VỤ KHÁCH HÀNG", style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold
                    //           ),
                    //           ),
                    //         ],
                    //       ),
                    //       Row(
                    //         children: [
                    //           Text("DỊCH VỤ KHÁCH HÀNG", style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold
                    //           ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ))
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}


