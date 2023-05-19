import 'package:flutter/material.dart';
import 'package:metiz_cinema/models/post.dart';
import 'package:metiz_cinema/screen/Ticket/chonGhe.dart';
import 'package:metiz_cinema/screen/Ticket/pay.dart';
import 'package:metiz_cinema/services/movies.dart';

class membercard extends StatefulWidget {
  final Post postData;
  final double totalPrice;
  const membercard({Key? key, required this.postData, required this.totalPrice}) : super(key: key);

  @override
  State<membercard> createState() => _membercardState();
}

class _membercardState extends State<membercard> {
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
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back)),
        title: Text(
          "THẺ THÀNH VIÊN",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              child: Image.asset("images/membercard.png"),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Qúy khác vui lòng nhập thẻ thành viên để nhận điểm thưởng hoặc nhấn bỏ qua nếu chưa có thẻ thành viên.\n"
                            "Lưu ý: Mã thẻ hợp lệ là phần trước dấu *." , style: TextStyle(
                          color: Colors.white,
                          fontSize: 13
                      ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Mã thẻ thành viên",
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => pay(postData: widget.postData, totalPrice: widget.totalPrice,)));
                            },
                            color: Colors.orange,
                            minWidth: 370,
                            height: 40,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "TIẾP TỤC",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                   Column(
                     children: [
                       Container(
                         padding: EdgeInsets.only(top: 20,bottom: 20),
                         child: Text(
                           "Hoặc",style: TextStyle(
                           color: Colors.white
                         ),
                         ),
                       ),
                     ],
                   ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            minWidth: 330,
                            height: 40,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Text(
                              "BỎ QUA",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
