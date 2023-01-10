import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/commingsoon.dart';
import 'package:metiz_cinema/components/nowshow.dart';

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
      appBar: AppBar(
        title: Image.asset('images/logo_metiz.png', height: 70,),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
          },
        ),
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
      body: TabBarView(children: [
        nowShow(),
        commingSoon()
      ])
    ),
  );
}
