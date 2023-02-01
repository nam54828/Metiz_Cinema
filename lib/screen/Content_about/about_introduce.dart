import 'package:flutter/material.dart';
import 'package:metiz_cinema/screen/about.dart';

class Introduce extends StatefulWidget {
  const Introduce({Key? key}) : super(key: key);

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => About())), icon: Icon(Icons.arrow_back)),
        title: Text("GIỚI THIỆU", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  child: Image.asset('images/about_introduce.jpg'),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 150),
                                    child: Image.asset('images/logo_metiz.png',
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 300),
                    child: Text(
                      '"Metiz Cinema, cụm rạp 5\n phòng chiếu lần đầu tiên\n xuất hiện tại Đà Nẵng, đem\n đến cho bạn những trải\n nghiệm điện ảnh tươi mới\n tuyệt hảo với mức giá ưu\n đãi nhất." ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Text(
                        'Chào mừng bạn đến với Metiz Cinema!',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      Expanded(child: Text(
                        'Chúng tôi muốn kể cho bạn câu chuyện về mình là ai, giá trị nào là cốt lõi và cách chúng tôi đem đến cho khách hàng những cảm xúc trọn vẹn nhất. ',
                        style: TextStyle(
                            color: Colors.white
                        ),
                        textAlign: TextAlign.justify,
                      )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      Expanded(child: Text(
                        "Bạn có thể từng trải nghiệm nhiều rạp chiếu phim chuyên nghiệp tại Đà Nẵng, phục vụ đáp ứng nhu cầu của phần đông khán giả trẻ những năm gần đây. Nhưng có lẽ bạn chưa biết về một Metiz Cinema, cụm rạp trẻ hứa hẹn đem đến cho bạn trải nghiệm tuyệt vời nhất với mức giá vô cùng ưu đãi. \n",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      Expanded(child: Text(
                        'Lần đầu tiên xuất hiện tại Đà Nẵng, Metiz Cinema đem đến 5 phòng chiếu phim được trang bị những công nghệ hiện đại nhất. Thưởng thức phim tại Metiz Cinema là bạn được sống trong không gian hình ảnh chân thực với thiết kế màn hình uốn cong cực đại, phản chiếu tốt từ mọi hướng nhìn. Âm thanh cực đã đến từ công nghệ Dolby danh tiếng cho trải nghiệm thính giác vô cùng sống động. Phòng chiếu sang trọng với công nghệ ghế da cao cấp cùng các tiện nghi được đáp ứng phù hợp nhất. ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
