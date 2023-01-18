import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/about_introduce.dart';
import 'package:metiz_cinema/components/about_setting.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/Carousel/sliderCarousel.dart';
import 'package:metiz_cinema/screen/about.dart';
import 'package:metiz_cinema/screen/LOGIN/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metiz',
      debugShowCheckedModeBanner: false,
      home:AppBarHome(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}