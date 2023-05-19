import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/profile/profile.dart';

class transaction extends StatefulWidget {
  const transaction({Key? key}) : super(key: key);

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 29, 47, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => profile())), icon: Icon(Icons.arrow_back)),
        title: Text("LỊCH SỬ GIAO DỊCH", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top:20, bottom: 20),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: currentUser.currentUser?.photoURL != null
                              ? NetworkImage(currentUser.currentUser!.photoURL!)
                              : NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/2048px-Circle-icons-profile.svg.png"),
                        )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child:  Expanded(
                          child: StreamBuilder(
                            stream: FirebaseDatabase.instance.ref().child('users').child(currentUser.currentUser!.uid).child('fullname').onValue,
                            builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
                              if (snapshot.hasData) {
                                final fullname = snapshot.data?.snapshot.value?.toString() ?? '';
                                return Center(
                                  child: Text(
                                    fullname,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Satoshi-Bold',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bạn đã thực hiện thành công", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("0 giao dịch", style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
