import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/models/postNews.dart';
import 'package:metiz_cinema/services/news.dart';
import 'package:shimmer/shimmer.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool enable = true;
  List<postNews> postDataNews = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newAPI.fetchPost().then((dataFromServer) {
      setState(() {
        postDataNews = dataFromServer;
        loadData();
      });
    });
  }
  loadData()async{
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      enable = false;
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
      body:  ListView.builder(
          itemCount: postDataNews.length,
          itemBuilder: (context, index) {
            if (enable) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          child: Container(
                            width: double.infinity,
                            color: Colors.white,
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
                                padding:
                                EdgeInsets.only(top: 160, left: 15),
                                width: 500,
                                height: 40,
                                color: Colors.white,
                              ),
                              Container(
                                padding:
                                EdgeInsets.only(left: 15, top: 5),
                                width: 300,
                                height: 40,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Stack(
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
                                padding:
                                EdgeInsets.only(top: 160, left: 15),
                                child: Text(
                                  "${postDataNews[index].header}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              Container(
                                padding:
                                EdgeInsets.only(left: 15, top: 5),
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
                                  colors: [Colors.black12, Colors.black],
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter)),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
          }),
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
        )
    );
  }
}
