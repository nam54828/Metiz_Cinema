import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/about.dart';

class Introduce extends StatefulWidget {
  const Introduce({Key? key}) : super(key: key);

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => About()));
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Color.fromRGBO(221, 221, 221, 1),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.03),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 90, top: 20),
                        child: Text(
                          "GIỚI THIỆU",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(230, 230, 230, 1)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          child: Image.asset('images/about_introduce.jpg'),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 150),
                            child: Image.asset('images/logo_metiz.png',
                              height: 80,
                              width: 80,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
