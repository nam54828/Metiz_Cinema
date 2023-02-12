import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(14, 29, 47, 1),
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AppBarHome())), icon: Icon(Icons.arrow_back)),
          title: Text("THÔNG BÁO", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14
          ),
          ),
        ),
      body: Container(
        child: Center(
          child: Text(
            "Bạn hiện không có thông báo nào.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13
            ),
          ),
        ),
      ),
    );
  }
}
