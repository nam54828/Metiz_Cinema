import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:metiz_cinema/models/postNews.dart';
import 'package:metiz_cinema/newAppBar.dart';
import 'package:metiz_cinema/screen/about.dart';
import 'package:metiz_cinema/screen/blog.dart';
import 'package:metiz_cinema/screen/commingsoon.dart';
import 'package:metiz_cinema/screen/LOGIN/login.dart';
import 'package:metiz_cinema/screen/movies.dart';
import 'package:metiz_cinema/screen/news.dart';
import 'package:metiz_cinema/screen/notification.dart';
import 'package:metiz_cinema/screen/nowshow.dart';
import 'package:metiz_cinema/screen/profile/information.dart';
import 'package:metiz_cinema/screen/profile/profile.dart';
import 'package:metiz_cinema/screen/showtimes.dart';
import 'package:metiz_cinema/services/news.dart';

class AppBarHome extends StatefulWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

TabBar get _tabBar => TabBar(
      labelColor: Colors.white,
      indicatorColor: Colors.orange,
      tabs: [
        Tab(icon: null, text: 'ĐANG CHIẾU'),
        Tab(icon: null, text: 'SẮP CHIẾU')
      ],
    );
final currentUser = FirebaseAuth.instance;
User? user;
final ref = FirebaseDatabase.instance.ref().child('users');

class _AppBarHomeState extends State<AppBarHome> {
  List<postNews> postDataNews = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = currentUser
        .currentUser; // kiểm tra nếu người dùng đang đăng nhập hoặc null
    newAPI.fetchPost().then((dataFromServer) {
      setState(() {
        postDataNews = dataFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(14, 29, 47, 1),
          appBar: AppBar(
            title: Image.asset(
              'images/logo_metiz.png',
              height: 70,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => notification()));
                },
                icon: Icon(Icons.notifications_none),
              )
            ],
            backgroundColor: Color.fromRGBO(14, 29, 47, 1),
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      PreferredSize(
                        preferredSize: _tabBar.preferredSize,
                        child: Material(
                          color: Color.fromRGBO(148, 79, 234, 1),
                          child: _tabBar,
                        ),
                      ),
                      Container(
                        height: 430,
                        color: Colors.white,
                        child: TabBarView(children: [nowShow(), commingSoon()]),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        height: 40,
                        color: Color.fromRGBO(148, 79, 234, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "TIN TỨC & KHUYẾN MÃI",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Container(
                                    width: 70,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Tất cả",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.arrow_right_alt,
                                              size: 15,
                                              color: Colors.white,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius:
                                            BorderRadius.circular(36)),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => News()));
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 670,
                        child: newAppBar(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            backgroundColor: Color.fromRGBO(38, 53, 71, 1),
            child: Column(
              children: [
                Container(
                    height: 90,
                    color: Colors.black,
                    padding: EdgeInsets.only(left: 5, top: 15, bottom: 5),
                    child: headerWidget(context)),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.green,
                  ),
                  title: Text(
                    'Trang chủ',
                    style: TextStyle(color: Color.fromRGBO(20, 112, 108, 1)),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AppBarHome()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.calendar_month,
                    color: Colors.orange,
                  ),
                  title: Text(
                    'Lịch chiếu',
                    style: TextStyle(color: Color.fromRGBO(20, 112, 108, 1)),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => showTimes()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.local_movies,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    'Phim',
                    style: TextStyle(color: Color.fromRGBO(20, 112, 108, 1)),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Movies()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.drafts,
                    color: Colors.purple,
                  ),
                  title: Text(
                    'Tin tức & Khuyễn mãi',
                    style: TextStyle(color: Color.fromRGBO(20, 112, 108, 1)),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => News()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.rss_feed,
                    color: Colors.greenAccent,
                  ),
                  title: Text(
                    'Blog phim',
                    style: TextStyle(color: Color.fromRGBO(20, 112, 108, 1)),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Blog()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.error,
                    color: Colors.lightBlueAccent,
                  ),
                  title: Text(
                    'Về Metiz Cinema',
                    style: TextStyle(color: Color.fromRGBO(20, 112, 108, 1)),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => About()));
                  },
                ),
                (user != null)
                    ? Container(
                        margin: EdgeInsets.only(top: 300),
                        child: ElevatedButton(
                          onPressed: () {
                            FirebaseAuth
                                .instance // lấy dữ liệu người dùng đã đăng nhập
                                .signOut()
                                .then((value) {
                              setState(() {
                                currentUser;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppBarHome()));
                            });
                          },
                          child: Icon(
                            Icons.logout_outlined,
                            color: Color.fromRGBO(6, 1, 180, 0.4),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      );
}

Widget headerWidget(context) {
  return Row(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: currentUser.currentUser?.photoURL != null
            ? NetworkImage(currentUser.currentUser!.photoURL!)
            : NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/2048px-Circle-icons-profile.svg.png"),
      ),
      const SizedBox(
        width: 20,
      ),
      (user != null)
          ? Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: StreamBuilder(
                              stream: FirebaseDatabase.instance.ref().child('users').child(currentUser.currentUser!.uid).child('fullname').onValue,
                              builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
                                if (snapshot.hasData) {
                                  final fullname = snapshot.data?.snapshot.value?.toString() ?? '';
                                  return Text(
                                    fullname,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Satoshi-Bold',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),

                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => profile()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      child: Row(
                        children: [
                          Expanded(
                              child: StreamBuilder(
                                stream: FirebaseDatabase.instance.ref().child('users').child(currentUser.currentUser!.uid).child('email').onValue,
                                builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
                                  if (snapshot.hasData) {
                                    final email = snapshot.data?.snapshot.value?.toString() ?? '';
                                    return Text(
                                      email,
                                      style: TextStyle(color: Color.fromRGBO(
                                          216, 212, 212, 1),
                                          fontFamily: 'Satoshi-Regular',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => profile()));
                      },
                    ),
                  )
                ],
              ),
            )
          : Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          'ĐĂNG NHẬP/ĐĂNG KÝ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      })
                ],
              ),
            ),
    ],
  );
}
