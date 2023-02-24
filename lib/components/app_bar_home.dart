import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:metiz_cinema/models/postNews.dart';
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
final user = currentUser.currentUser;


class _AppBarHomeState extends State<AppBarHome> {
  List<postNews> postDataNews = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => notification()));
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
                       height: 450,
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
                               Container(
                                 child: InkWell(
                                   child: Text("Tất cả",
                                       style: TextStyle(
                                           color: Colors.white,
                                           fontWeight: FontWeight.bold)),
                                 ),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(30),
                                   color: Colors.grey,
                                 ),
                               )
                             ],
                           ),
                         ],
                       ),
                     ),
                     Container(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: StaggeredGrid.count(
                           crossAxisCount: 4,
                           mainAxisSpacing: 4,
                           crossAxisSpacing: 4,
                           children: [
                             StaggeredGridTile.count(crossAxisCellCount: 2,
                                 mainAxisCellCount: 2,
                                 child: Image.asset('images/about_introduce.jpg',fit: BoxFit.cover)
                             ),
                             StaggeredGridTile.count(crossAxisCellCount: 2,
                                 mainAxisCellCount: 2,
                                 child: Image.asset('images/about_introduce.jpg', fit: BoxFit.cover,)
                             ),
                             StaggeredGridTile.count(crossAxisCellCount: 4,
                                 mainAxisCellCount: 2,
                                 child: Image.asset('images/about_introduce.jpg', fit: BoxFit.cover,)
                             ),
                             StaggeredGridTile.count(crossAxisCellCount: 2,
                                 mainAxisCellCount: 2,
                                 child: Image.asset('images/about_introduce.jpg', fit: BoxFit.cover,)
                             ),
                             StaggeredGridTile.count(crossAxisCellCount: 2,
                                 mainAxisCellCount: 2,
                                 child: Image.asset('images/about_introduce.jpg',fit: BoxFit.cover,)
                             ),
                             StaggeredGridTile.count(crossAxisCellCount: 4,
                                 mainAxisCellCount: 2,
                                 child: Image.asset('images/about_introduce.jpg', fit: BoxFit.cover,)
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               )
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
                (user != null) ?  Container(
                  margin: EdgeInsets.only(top: 300),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth
                          .instance // lấy dữ liệu người dùng đã đăng nhập
                          .signOut()
                          .then((value) {
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
                ) : Container()
              ],
            ),
          ),
        ),
      );
}

Widget headerWidget(context) {
  const url =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEKWsrQjrLklNeCqRe4FXVCTLKzyQaXWqwWUDyFvq8e1YXaPFu-thyqOzkiwXLshME9H0&usqp=CAU';
  return Row(
    children: [
      const CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(url),
      ),
      const SizedBox(
        width: 20,
      ),
      (user != null)
          ? Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
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
                                        child: Text(
                                          data['fullname'],
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(255, 255, 255, 1),
                                              fontFamily: 'Satoshi-Bold',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => profile()));
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
                                        child: Container(
                                          child: Text(
                                            data['email'],
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    216, 212, 212, 1),
                                                fontFamily: 'Satoshi-Regular',
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400),
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
                        ],
                      ),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => profile()));
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
