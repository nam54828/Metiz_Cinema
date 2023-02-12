import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/Content_about/about_setting.dart';
import 'package:metiz_cinema/screen/profile/changepassword.dart';
import 'package:metiz_cinema/screen/profile/information.dart';
import 'package:metiz_cinema/screen/profile/membership.dart';
import 'package:metiz_cinema/screen/profile/transaction.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AppBarHome())), icon: Icon(Icons.arrow_back)),
        title: Text("TÀI KHOẢN CỦA TÔI", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
        ),
        ),
      ),
      body:SingleChildScrollView(
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
              color: Colors.purple,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                        padding:EdgeInsets.only(right: 190),
                        child: Text(
                          "Thông tin tài khoản",
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
                    child: IconButton(
                      onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => information())),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                        padding:EdgeInsets.only(right: 220),
                        child: Text(
                          "Đổi mật khẩu",
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
                  Column(
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context) => changePassword())),
                          icon: Icon(Icons.chevron_right, color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2,),
            Container(
              color: Colors.purple,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                        padding:EdgeInsets.only(right: 210),
                        child: Text(
                          "Thẻ thành viên",
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
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => membership()));
                      },
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                        padding: EdgeInsets.only(right: 190),
                        child: Text(
                          "Lịch sử giao dịch",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> transaction()));
                          },
                          icon: Icon(Icons.chevron_right, color: Colors.white,),
                        ),
                      ),
                    ],
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
