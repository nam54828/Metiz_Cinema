import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
class showTimes extends StatefulWidget {
  const showTimes({Key? key}) : super(key: key);

  @override
  State<showTimes> createState() => _showTimesState();
}

class _showTimesState extends State<showTimes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AppBarHome())), icon: Icon(Icons.arrow_back)),
        title: Text("LỊCH CHIẾU METIZ", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(

        ),
      ),
    );
  }
}
