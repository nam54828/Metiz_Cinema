import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class sliderCarousel extends StatefulWidget {
  const sliderCarousel({Key? key}) : super(key: key);

  @override
  State<sliderCarousel> createState() => _sliderCarouselState();
}

class _sliderCarouselState extends State<sliderCarousel> {
  final urlImages = [
    'https://metiz.vn/media/poster_film/tu_tu_hoi_sinh_poster_1_.jpg',
    'https://metiz.vn/media/poster_film/puss_in_boots_30.12.22_700x1000px.png',
    'https://metiz.vn/media/poster_film/406x600-ddd-final_1_.jpg',
    'https://metiz.vn/media/poster_film/470wx700h-real-ghost.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider.builder(
          options: CarouselOptions(height: 300,
          enlargeCenterPage: true ,//Hình nổi lên
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex){
            final urlImage = urlImages[index];

            return buildImage(urlImage, index);
          },
        ),
      ),
    );
  }
}
Widget buildImage(String urlImage, int index) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 24), // khoảng cách Images
    color: Colors.grey,
    child: Image.network(
      urlImage,
      fit: BoxFit.cover,
    ),
  );
}

