import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/components/date_selector.dart';
import 'package:metiz_cinema/models/post.dart';
import 'package:metiz_cinema/services/movies.dart';

import '../components/time_selector.dart';
class showTimes extends StatefulWidget {
  const showTimes({Key? key}) : super(key: key);

  @override
  State<showTimes> createState() => _showTimesState();
}

class _showTimesState extends State<showTimes> {
  List<Post> postData = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    movieAPI.fetchPost().then((dataFromServer) {
      setState(() {
        postData = dataFromServer;
        isLoading = false;
      });
    });
  }


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
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                height: 90,
                child: DateSelector()
            ),
            Expanded(
              child: ListView.builder(
                itemCount: postData.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 120),
                              color: Colors.white,
                              height: 150,
                              width: double.infinity,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: Image.network("${postData[index].image}", height: 200, width: 150),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      color: Colors.white54,
                                      child: Text("20:30-22:05"),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 80,
                                      left: 20
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${postData[index].tenPhim} (${postData[index].phong})", style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),),
                                      Text("Thời lượng ${postData[index].thoiLuong} phút")
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
