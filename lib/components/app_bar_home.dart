import 'package:flutter/material.dart';
import 'package:metiz_cinema/main.dart';
import 'package:metiz_cinema/screen/about.dart';
import 'package:metiz_cinema/screen/commingsoon.dart';
import 'package:metiz_cinema/screen/nowshow.dart';

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
    Tab(icon: null, text: 'ĐANG CHIẾU')
  ],
);

class _AppBarHomeState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        title: Image.asset('images/logo_metiz.png', height: 70,),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
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
        )
      ),
      body: Container(
        height: 400,
        color: Colors.white,
        child: TabBarView(children: [
          nowShow(),
          commingSoon()
        ]),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.home, color: Colors.green,),
              title: Text('Trang chủ'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppBarHome()));
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month, color: Colors.orange,),
              title: Text('Lịch chiếu'),
            ),
            ListTile(
              leading: Icon(Icons.local_movies, color: Colors.blueAccent,),
              title: Text('Phim'),
            ),
            ListTile(
              leading: Icon(Icons.drafts, color: Colors.purple,),
              title: Text('Tin tức & Khuyễn mãi'),
            ),
            ListTile(
              leading: Icon(Icons.rss_feed, color: Colors.greenAccent,),
              title: Text('Blog phim'),
            ),
            ListTile(
              leading: Icon(Icons.error, color: Colors.lightBlueAccent,),
              title: Text('Về Metiz Cinema'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => About()));
              },
            ),
          ],
        ),
      ),
    ),
  );
}
