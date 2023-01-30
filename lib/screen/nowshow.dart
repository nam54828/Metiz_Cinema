import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class nowShow extends StatefulWidget {
  const nowShow({Key? key}) : super(key: key);

  @override
  State<nowShow> createState() => _nowShowState();
}

class _nowShowState extends State<nowShow> {
  final urlImages = [
    'https://metiz.vn/media/poster_film/tu_tu_hoi_sinh_poster_1_.jpg',
    'https://metiz.vn/media/poster_film/puss_in_boots_30.12.22_700x1000px.png',
    'https://metiz.vn/media/poster_film/406x600-ddd-final_1_.jpg',
    'https://metiz.vn/media/poster_film/470wx700h-real-ghost.jpg',
  ];
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
                options: CarouselOptions(height: 370,
                    enlargeCenterPage: true ,//Hình nổi lên
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    pageSnapping: true
                ),
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex){
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                },
              ),
              const SizedBox(height: 25,),
              Container(
                child: Text(
                  "Example", style: TextStyle(
                    color: Colors.white
                ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                child: Text(
                  "Thời lượng""Khởi chiếu",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
Widget buildImage(String urlImage, int index) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 24), // khoảng cách Images
    color: Colors.grey,
    width: double.infinity,
    child: Image.network(
      urlImage,
      fit: BoxFit.cover,
    ),
  );
}


