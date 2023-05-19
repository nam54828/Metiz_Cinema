import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/components/date_selector.dart';
import 'package:metiz_cinema/models/post.dart';
import 'package:metiz_cinema/screen/Ticket/chonGhe.dart';
import 'package:metiz_cinema/screen/templates/templateMovie.dart';
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
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network("${postData[index].image}", height: 200, width: 130, fit: BoxFit.cover,),
                                      ),
                                    ),

                                    Container(
                                      child: InkWell(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 80,
                                                height: 30,
                                                child: Center(
                                                  child: Text("17:25-19:45" , style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black
                                                  ),),
                                                ),
                                                decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                  borderRadius: BorderRadius.circular(5)
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 80,
                                              height: 30,
                                              child: Center(
                                                child: Text("17:25-19:45" , style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black
                                                ),),
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                            )
                                          ],
                                        ),
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => SeatBookingPage(postData: postData[index])));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 80,
                                      left: 5
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${postData[index].tenPhim} (${postData[index].phong})", style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),),
                                      SizedBox(height: 10,),
                                      Text("Thời lượng ${postData[index].thoiLuong} phút" , style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400
                                      ),)
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
