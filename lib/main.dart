import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:metiz_cinema/screen/Ticket/membercard.dart';
import 'firebase_options.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print("This is message from background");
  print(message.notification!.title);
  print(message.notification!.body);
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
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

