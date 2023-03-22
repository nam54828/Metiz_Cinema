import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/date_selector.dart';
import 'package:metiz_cinema/components/time_selector.dart';
import 'package:metiz_cinema/models/post.dart';
import 'package:metiz_cinema/screen/movies.dart';
import 'package:metiz_cinema/screen/templates/templateMovie.dart';
import 'package:metiz_cinema/services/movies.dart';

class datVe extends StatefulWidget {
  const datVe({Key? key}) : super(key: key);

  @override
  State<datVe> createState() => _datVeState();
}

class _datVeState extends State<datVe> {
  List<Post> postData = [];

  late int index = postData.length;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieAPI.fetchPost().then((dataFromServer) {
      setState(() {
        postData = dataFromServer;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      body: Padding(
        padding: EdgeInsets.only(top:0),
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: Expanded(
                      child: Image.network('${postData[index].image}', height: 550, width: double.infinity, fit: BoxFit.fill,),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => templateMovie()));
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 550,
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15, top: 400),
                              child: Text(
                                '${postData[index].tenPhim}'
                                    ' (${postData[index].phong})',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timelapse,
                                        size: 50,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Thời lượng",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${postData[index].thoiLuong} Phút",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 50,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Khởi chiếu",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${postData[index].khoiChieu}",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 110,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Text(
                                            "Xem Trailer",
                                            style:
                                            TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Container(
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                              BorderRadius.circular(30)),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(14, 29, 47, 1),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black12, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ],
              ),
              Container(
                height: 100,
                  child: DateSelector()),
              Container(

                  child: TimeSelector()),
            ],
          ),
        ),
      ),
    );
  }
}
