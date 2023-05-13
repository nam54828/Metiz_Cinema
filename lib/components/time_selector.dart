import 'package:flutter/material.dart';
import 'package:metiz_cinema/constants/constants.dart';
import 'package:metiz_cinema/screen/Ticket/chonGhe.dart';
import 'package:metiz_cinema/screen/commingsoon.dart';
import 'package:metiz_cinema/services/movies.dart';

import '../models/post.dart';

class TimeSelector extends StatefulWidget {
  final Post postData;
  const TimeSelector({Key? key, required this.postData}) : super(key: key);
  
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  int timeIntexSelected = 1;

  var time = [
    ["01:30", 01],
    ["06:30", 02],
    ["10:30", 03]
  ];


  Widget _timeItem(time, phong, bool active) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: appPadding * 0.75),
      decoration: BoxDecoration(
        border: Border.all(
          color: active ? primary : white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
                  text: time,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: active ? primary : white,
                  ),
              )
          ),
          Text(
            "Phòng ${phong}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: grey,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 17,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.035),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    timeIntexSelected = index;
                  });
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Metiz Cinema", style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,),
                        content: Text("Tôi xác nhận mua vé cho người xem từ 18 Tuổi trở lên và hiểu rằng Metiz sẽ không hoàn tiền nếu không chứng thực được độ tuổi của khán giả.Tham khảo quy định của Bộ Văn Hóa, Thể Thao và Du lịch.",
                        textAlign: TextAlign.center,),
                        actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              child: Text("Hủy",style: TextStyle(
                                  color: Colors.blue
                              )),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text("Đồng ý",style: TextStyle(
                                  color: Colors.blue
                              )),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SeatBookingPage(postData: widget.postData),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                        ],
                      );
                    },
                  );
                },
                child: _timeItem(
                  time[index][0],
                  time[index][1],
                  index == timeIntexSelected ? true : false,
                ),
              ),
            );

          },
        ),
      ),
    );
  }
}
