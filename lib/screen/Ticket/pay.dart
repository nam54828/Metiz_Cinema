import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/models/post.dart';

class pay extends StatefulWidget {
  final Post postData;
  final double totalPrice;
  const pay({Key? key, required this.postData, required this.totalPrice}) : super(key: key);

  @override
  State<pay> createState() => _payState();
}

class _payState extends State<pay> {
  int selectedButton = 0;
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
          "THANH TOÁN",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20,bottom: 40),
                child: Text(
                  "Thông tin đặt vé",
                  style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Text("Tên Phim:",style: TextStyle(
                          color: Colors.white
                        ),)],
                      ),
                      Column(
                        children: [Text("${widget.postData.tenPhim} X (${widget.postData.phong})",style: TextStyle(
                            color: Colors.white
                        ),)],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Text("Suất Chiếu:",style: TextStyle(
                            color: Colors.white
                        ),)],
                      ),
                      Column(
                        children: [Text("${widget.postData.khoiChieu}",style: TextStyle(
                            color: Colors.white
                        ),)],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Text("Rạp:",style: TextStyle(
                            color: Colors.white
                        ),)],
                      ),
                      Column(
                        children: [Text("Metiz Cinema",style: TextStyle(
                            color: Colors.white
                        ),)],
                      )
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.white,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Text("Số Lượng Vé:",style: TextStyle(
                            color: Colors.white
                        ),)],
                      ),
                      Column(
                        children: [Text("Ghế: ",style: TextStyle(
                            color: Colors.white
                        ),)],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Text("Chi Phí:",style: TextStyle(
                            color: Colors.white
                        ),)],
                      ),
                      Column(
                        children: [Text("${widget.totalPrice}00 VNĐ",style: TextStyle(
                            color: Colors.orange
                        ),)],
                      )
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.white12,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Text("Giảm giá:",style: TextStyle(
                            color: Colors.white
                        ),)],
                      ),
                      Column(
                        children: [Text("0 VNĐ",style: TextStyle(
                            color: Colors.white
                        ),)],
                      )
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.white12,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Text("Tổng Thanh Toán:",style: TextStyle(
                            color: Colors.white
                        ),)],
                      ),
                      Column(
                        children: [Text("${widget.totalPrice}00 VNĐ",style: TextStyle(
                            color: Colors.green
                        ),)],
                      )
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.white12,),
              SizedBox(
                height: 20,
              ),
              Text("Phương thức thanh toán", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                          selectedButton = 0;
                      });
                      }, icon: selectedButton == 0 ?  Icon(Icons.radio_button_checked,color: Colors.orange,): Icon(Icons.radio_button_unchecked, color: Colors.orange,)),
                      Image.asset("images/card.png", width: 50,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Internet Banking/Thẻ tín dụng", style: TextStyle(
                          color: Colors.white
                        ),),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                          selectedButton = 1;
                        });
                      }, icon: selectedButton == 1 ?  Icon(Icons.radio_button_checked,color: Colors.orange,) : Icon(Icons.radio_button_unchecked, color: Colors.orange,) ),
                      Image.asset("images/cardmetiz.png" , width: 50,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Thẻ Metiz", style: TextStyle(
                            color: Colors.white
                        ),),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                          selectedButton = 2;
                        });
                      }, icon:selectedButton == 2 ? Icon(Icons.radio_button_checked_outlined,color: Colors.orange,) : Icon(Icons.radio_button_unchecked, color: Colors.orange,)),
                      Image.asset("images/helio.png", width: 50,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Thẻ Helio", style: TextStyle(
                            color: Colors.white
                        ),),
                      )
                    ],
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
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("ĐẶT VÉ THÀNH CÔNG" , textAlign: TextAlign.center,),
                            content: Text("Vé của bạn đã được đặt thành công \n"
                                "Thông tin vé của bạn sẽ được gửi tới số điện thoại hoặc email của bạn \n"
                            "Thân!.",
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    // navigate back to home page
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppBarHome()));
                                  })
                            ],
                          ),
                        );
                      },
                      color: Colors.orange,
                      minWidth: 360,
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
            ],
          ),
        ),
      ),
    );
  }
}
