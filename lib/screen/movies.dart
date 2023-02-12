import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/models/post.dart';
import 'package:metiz_cinema/services/movies.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AppBarHome())), icon: Icon(Icons.arrow_back)),
        title: Image.asset('images/logo_metiz.png', height: 70,)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 1/2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 5
        ),
            itemCount: postData.length,
            itemBuilder: (BuildContext, index){
              return  InkWell(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4), // khoảng cách Images
                          color: Colors.grey,
                          width: double.infinity,
                          child: Image.network(
                            '${postData[index].image}',
                            fit: BoxFit.cover,
                            height: 250,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 8),
                          child: Text(
                            "${postData[index].tenPhim}"" ${postData[index].phong}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 8),
                          child: Text(
                            "${postData[index].theLoai}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 8),
                          child: Text(
                            "${postData[index].thoiLuong}"" | ""${postData[index].phong}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 8),
                          child: Text(
                            "${postData[index].khoiChieu}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        // Container(
                        //   width: 130,
                        //   height: 32,
                        //   child: InkWell(
                        //     child: Text(
                        //       "ĐẶT VÉ", style: TextStyle(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 10
                        //     ),
                        //     ),
                        //   ),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(16)
                        //   ),
                        // )
                      ],
                    ),
                  ),
                );
            }
            ),
      )
    );
  }
}
