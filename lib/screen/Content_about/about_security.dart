import 'package:flutter/material.dart';
import 'package:metiz_cinema/screen/about.dart';

class security extends StatefulWidget {
  const security({Key? key}) : super(key: key);

  @override
  State<security> createState() => _securityState();
}

class _securityState extends State<security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("CHÍNH SÁCH BẢO MẬT", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14),),
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => About())), icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
