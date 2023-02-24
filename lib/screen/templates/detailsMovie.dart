import 'package:flutter/material.dart';
import 'package:metiz_cinema/models/post.dart';
import 'package:metiz_cinema/screen/movies.dart';
import 'package:metiz_cinema/services/movies.dart';

class detailsMovie extends StatelessWidget {

  @required
  final Post postData;

  const detailsMovie({super.key,required this.postData});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child:  Expanded(
                      child:  Image.network('${postData.image}'),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Movies()));
                            }, icon:Icon(Icons.arrow_back, color: Colors.white,))
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(onPressed: (){}, icon:Icon(Icons.share, color: Colors.white,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 600,
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15, top: 400),
                              child: Text('${postData.tenPhim}' ' (${postData.phong})', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20
                              ),),
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
                                      Icon(Icons.timelapse, size: 50,color: Colors.white,)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Thời lượng", style: TextStyle(
                                          color: Colors.white
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("${postData.thoiLuong} Phút", style: TextStyle(
                                          color: Colors.white
                                      ),)
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today, size: 50,color: Colors.white,)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Khởi chiếu", style: TextStyle(
                                          color: Colors.white
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("${postData.khoiChieu}", style: TextStyle(
                                          color: Colors.white
                                      ),)
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 5),
                                          child:  Text("Xem Trailer", style: TextStyle(
                                              color: Colors.white
                                          ),),
                                        ),
                                        Container(
                                          child: Icon(Icons.play_arrow, color: Colors.white,),
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius: BorderRadius.circular(30)
                                          ),

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
                            colors: [Colors.black12,
                              Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 550),
                      width: 330,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "ĐẶT VÉ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                ],
              ),
              Container(
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: Column(
                              children: [
                                Text("Diễn Viên: ", style: TextStyle(
                                    color: Colors.white
                                ),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 35, top: 20, right: 10),
                              child: Column(
                                children: [
                                  Text("${postData.dienVien}", style: TextStyle(
                                      color: Colors.grey
                                  ),
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.clip,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 15),
                                child: Text("Đạo diễn:", style: TextStyle(
                                    color: Colors.white
                                ),),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 40, top: 15),
                            child: Column(
                              children: [
                                Text("${postData.daoDien}", style: TextStyle(
                                    color: Colors.grey
                                ),)
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 15),
                                child: Text("Thể loại:", style: TextStyle(
                                    color: Colors.white
                                ),),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 47, top: 15),
                            child: Column(
                              children: [
                                Text("${postData.theLoai}", style: TextStyle(
                                    color: Colors.grey
                                ),)
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, top: 15),
                            child: Column(
                              children: [
                                Text("Kiểm duyệt:", style: TextStyle(
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 27, top: 15, right: 5),
                              child: Column(
                                children: [
                                  Text("${postData.kiemDuyet}", style: TextStyle(
                                      color: Colors.grey
                                  ),
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.clip,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
                                child: Text("Ngôn ngữ:", style: TextStyle(
                                    color: Colors.white
                                ),),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 35, top: 15, bottom: 15),
                            child: Column(
                              children: [
                                Text("${postData.ngonNgu}", style: TextStyle(
                                    color: Colors.grey
                                ),)
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
              ),
              Container(
                color: Color.fromRGBO(14, 29, 47, 1),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 20, bottom: 60),
                          child: Text("Giới thiệu phim", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only( left: 20, right: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("${postData.textTrailer}", style: TextStyle(
                                color: Colors.white
                            ),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
