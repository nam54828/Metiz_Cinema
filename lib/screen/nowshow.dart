import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:metiz_cinema/models/post.dart';
import 'package:metiz_cinema/services/movies.dart';
class nowShow extends StatefulWidget {
  const nowShow({Key? key}) : super(key: key);

  @override
  State<nowShow> createState() => _nowShowState();
}

class _nowShowState extends State<nowShow> {
  List<Post> postData = [];

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 5),
          child: Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(height: 480,
                    enlargeCenterPage: true ,//Hình nổi lên
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    pageSnapping: true
                ),
                itemCount: postData.length,
                itemBuilder: (context, index, realIndex){
                  final urlImage = postData[index].image;
                  return Column(
                    children: [
                      Container(
                        height:370,
                        child: buildImage(urlImage!, index),
                      ),
                      buildText(index),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24), // khoảng cách Images
      color: Colors.grey,
      width: double.infinity,
      child: Image.network(
        '${postData[index].image}',
        fit: BoxFit.cover,
      ),
    );
  }
  Widget buildText(int index) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('${postData[index].tenPhim} ''|' '${postData[index].phong}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                  ),))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Thời lượng: ${postData[index].thoiLuong} Phút' '-' ' Khỏi chiếu: ${postData[index].khoiChieu}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 10
                  ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
