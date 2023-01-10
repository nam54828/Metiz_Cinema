import 'package:flutter/material.dart';
class nowShow extends StatefulWidget {
  const nowShow({Key? key}) : super(key: key);

  @override
  State<nowShow> createState() => _nowShowState();
}

class _nowShowState extends State<nowShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Đang chiếu"),
    );
  }
}
