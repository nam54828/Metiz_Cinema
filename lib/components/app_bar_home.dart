import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/staggeredGridViewScreen.dart';
import 'package:metiz_cinema/main.dart';
import 'package:metiz_cinema/screen/about.dart';
import 'package:metiz_cinema/screen/blog.dart';
import 'package:metiz_cinema/screen/commingsoon.dart';
import 'package:metiz_cinema/screen/LOGIN/login.dart';
import 'package:metiz_cinema/screen/movies.dart';
import 'package:metiz_cinema/screen/news.dart';
import 'package:metiz_cinema/screen/nowshow.dart';
import 'package:metiz_cinema/screen/showtimes.dart';

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

class _AppBarHomeState extends State<AppBarHome> {
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
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none),
                )
              ],
              backgroundColor: Color.fromRGBO(14, 29, 47, 1),
              bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: Material(
                  color: Color.fromRGBO(148, 79, 234, 1),
                  child: _tabBar,
                ),
              )),
          body: Container(
            child: Column(
              children: [
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
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StaggeredGridViewScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                    height: 90,
                    color: Colors.black,
                    padding: EdgeInsets.only(left: 5, top: 15, bottom: 5),
                    child: headerWidget(context)
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.green,
                  ),
                  title: Text('Trang chủ'),
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
                  title: Text('Lịch chiếu'),
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
                  title: Text('Phim'),
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
                  title: Text('Tin tức & Khuyễn mãi'),
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
                  title: Text('Blog phim'),
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
                  title: Text('Về Metiz Cinema'),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => About()));
                  },
                ),
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
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'ĐĂNG NHẬP/ĐĂNG KÝ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Login()));
            },
          )
        ],
      )
    ],
  );
}
