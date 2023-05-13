import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}
class _notificationState extends State<notification> {
  String notificationMsg = "Bạn hiện không có thông báo nào.";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      // lưu thông báo vào Firestore
      await FirebaseFirestore.instance.collection('notifications').add({
        'title': event.notification!.title,
        'body': event.notification!.body,
        'timestamp': DateTime.now(),
      });
    });
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if(event != null){
        setState(() {
          notificationMsg =
          "${event.notification!.title} ${event.notification!.body}";
        });
      }
    });
    // Foregrand State
    FirebaseMessaging.onMessage.listen((event) {
      setState(() {
        notificationMsg =
        "${event.notification!.title} ${event.notification!.body}";
      });
    });
    // background State
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        notificationMsg =
        "${event.notification!.title} ${event.notification!.body}";
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
        title: Text('THÔNG BÁO', style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),
        leading: IconButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => AppBarHome()));
        }, icon: Icon(Icons.keyboard_backspace, color: Colors.white,)),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          // lấy dữ liệu từ collection "notifications"
          stream: FirebaseFirestore.instance
              .collection('notifications')
              .orderBy('timestamp', descending: true) // sắp xếp theo thời gian gần nhất trước
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Đã xảy ra lỗi: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.data == null || snapshot.data!.docs.length == 0) {
              return Center(
                child: Text(notificationMsg, style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
              );
            }
            // hiển thị danh sách các thông báo
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    title: Text(
                      data['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          data['body'],
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    leading: data['imageUrl'] != null
                        ? Image.network(
                      data['imageUrl'],
                      fit: BoxFit.fill,
                      height: 80,
                      width: 80,
                    )
                        : Image.asset(
                      "images/logo_metiz.png",
                      fit: BoxFit.fill,
                      height: 80,
                      width: 80,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}