import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:metiz_cinema/models/postNews.dart';
import 'package:metiz_cinema/services/news.dart';

class newAppBar extends StatefulWidget {
  const newAppBar({Key? key}) : super(key: key);

  @override
  State<newAppBar> createState() => _newAppBarState();
}

class _newAppBarState extends State<newAppBar> {
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
    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: postDataNews.length,
            itemBuilder: (context, index) {
              return Container(
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    StaggeredGridTile.count(crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: Stack(
                          children: [
                            Container(
                              child: Container(
                                width: double.infinity,
                                child: Image.network(
                                  '${postDataNews[0].image}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 150, left: 15),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "${postDataNews[0].header}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "${postDataNews[0].time}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 10
                                      ),
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
                    ),
                    StaggeredGridTile.count(crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: Stack(
                          children: [
                            Container(
                              child: Container(
                                width: double.infinity,
                                child: Image.network(
                                  '${postDataNews[1].image}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 150, left: 15),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "${postDataNews[1].header}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "${postDataNews[1].time}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 10
                                      ),
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
                    ),
                    StaggeredGridTile.count(crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: Stack(
                          children: [
                            Container(
                              child: Container(
                                width: double.infinity,
                                child: Image.network(
                                  '${postDataNews[2].image}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 150, left: 15),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "${postDataNews[2].header}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "${postDataNews[2].time}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 10
                                      ),
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
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
