import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Container(
                height: 80,
                color: Colors.black38,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.dehaze,
                              color: Color.fromRGBO(255, 84, 0, 1),
                              size: 40,
                            ))),
                    Expanded(
                        child: Image.asset(
                      'images/logo_metiz.png',
                    )),
                    Expanded(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.blue,
                              size: 40,
                            )))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
