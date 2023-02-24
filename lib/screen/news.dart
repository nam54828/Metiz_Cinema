import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/models/postNews.dart';
import 'package:metiz_cinema/services/news.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<postNews> postDataNews = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newAPI.fetchPost().then((dataFromServer) {
      setState(() {
        postDataNews = dataFromServer;
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
        leading: IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => AppBarHome())),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "TIN TỨC & KHUYẾN MÃI",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: ListView.builder(
        itemCount: postDataNews.length,
        itemBuilder: (context, index) {
          final urlImage = postDataNews[index].image;
          return buildImage(urlImage!, index);
        },
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              child: Container(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  '${postDataNews[index].image}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 160, left: 15),
                    child: Text(
                      "${postDataNews[index].header}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      "${postDataNews[index].time}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black12,
                        Colors.black],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter)),
            )
          ],
        ));
  }
}
