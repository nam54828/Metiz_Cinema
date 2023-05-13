import 'package:flutter/material.dart';

import 'package:metiz_cinema/constants/constants.dart';
import 'package:metiz_cinema/models/post.dart';

class SeatBookingPage extends StatefulWidget {
final Post postData;
  const SeatBookingPage({Key? key, required this.postData}) : super(key: key);

  @override
  _SeatBookingPageState createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends State<SeatBookingPage> {
  late List<List<Seat>> seats;
  List<Seat> selectedSeats = [];

  double totalPrice = 0;

  @override
  void initState() {
    super.initState();


    // initialize seats
    seats = List.generate(
        10, (i) => List.generate(15, (j) => Seat(row: i, number: j)));
    for (int j = 0; j < 15; j++) {
      seats[5][j].type = SeatType.vip;
      seats[6][j].type = SeatType.vip;
      seats[7][j].type = SeatType.vip;
      seats[8][j].type = SeatType.vip;
      seats[9][j].type = SeatType.vip;
    }
  }

  void calculateTotalPrice() {
    setState(() {
      totalPrice = selectedSeats.fold(0, (total, seat) => total + seat.price);
    });
  }
// Hàm tính toán số lượng ghế đã chọn
  int countSelectedSeats() {
    return selectedSeats.where((seat) => seat.status == SeatStatus.booked).length;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  child: Image.network("${widget.postData.image}" , height: 150, fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width * 1,),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 110, left: 20),
                  child: Column(
                    children: [
                      Text("${widget.postData.tenPhim} | ${widget.postData.phong}", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Positioned(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60.0),
                        topLeft: Radius.circular(60.0),
                      ),
                      gradient: LinearGradient(
                        colors: [white, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 1],
                      )),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.55,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: white,
                          ))),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Màn hình",style: TextStyle(
                    color: Colors.white54
                  ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: SeatGrid(
                seats: seats,
                selectedSeats: selectedSeats,
                onSelected: calculateTotalPrice),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Hàng ghế đã chọn:',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                       Row(
                         children: [
                           SizedBox(height: 8.0),
                           if (selectedSeats.isNotEmpty)
                             ...selectedSeats
                                 .where((seat) => seat.status == SeatStatus.booked)
                                 .map(
                                   (seat) => Container(
                                 margin: EdgeInsets.symmetric(horizontal: 4.0),
                                 child: Text(
                                   '${seat.number}.${seat.row + 1}',
                                   style: TextStyle(fontSize: 16.0),
                                 ),
                               ),
                             )
                         ],
                       )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Số ghế đã chọn:',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${countSelectedSeats()}',
                          style: TextStyle(fontSize: 16.0, color: Colors.orange),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Tổng số tiền:',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${totalPrice} VNĐ',
                          style: TextStyle(fontSize: 16.0, color: Colors.orange),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (selectedSeats.isNotEmpty) {
                // assume we have a payment gateway
                bool paymentSuccessful = true;

                if (paymentSuccessful) {
                  // mark seats as booked
                  for (var seat in selectedSeats) {
                    seat.status = SeatStatus.booked;
                  }

                  // show confirmation dialog
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("ĐẶT VÉ"),
                      content: Text("Your booking has been confirmed."),
                      actions: [
                        TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              // navigate back to home page
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  );

                  // clear selected seats and total price
                  setState(() {
                    selectedSeats.clear();
                    totalPrice = 0;
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Payment Failed"),
                      content:
                          Text("There was an error processing your payment."),
                      actions: [
                        TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  );
                }
              }
            },
            child: Text('TIẾP TỤC'),
          ),
        ],
      ),
    );
  }
}

class Seat {
  final int row;
  final int number;
  SeatType type = SeatType.regular;
  SeatStatus status = SeatStatus.available;

  Seat({required this.row, required this.number});

  double get price {
    switch (type) {
      case SeatType.regular:
        return 45;
      case SeatType.vip:
        return 60;
    }
  }
}

enum SeatType {
  regular,
  vip,
}

enum SeatStatus {
  available,
  booked,
}

class SeatGrid extends StatefulWidget {
  final List<List<Seat>> seats;
  final List<Seat> selectedSeats;
  final void Function() onSelected;

  const SeatGrid(
      {Key? key,
      required this.seats,
      required this.selectedSeats,
      required this.onSelected})
      : super(key: key);

  @override
  _SeatGridState createState() => _SeatGridState();
}

class _SeatGridState extends State<SeatGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 15,
      childAspectRatio: 1.2,
      children: List.generate(
        widget.seats.length * widget.seats.first.length,
        (index) {
          final i = index ~/ widget.seats.first.length;
          final j = index % widget.seats.first.length;

          return GestureDetector(
            onTap: () {
              setState(() {
                if (widget.seats[i][j].status == SeatStatus.available) {
                  // toggle selected state
                  widget.seats[i][j].status = SeatStatus.booked;
                  widget.selectedSeats.add(widget.seats[i][j]);
                  widget.onSelected();
                } else if (widget.seats[i][j].status == SeatStatus.booked) {
                  // un-select
                  widget.seats[i][j].status = SeatStatus.available;
                  widget.selectedSeats.remove(widget.seats[i][j]);
                  widget.onSelected();
                }
              });
            },
            child: SeatWidget(seat: widget.seats[i][j]),
          );
        },
      ),
    );
  }
}



class SeatWidget extends StatelessWidget {
  final Seat seat;

  const SeatWidget({Key? key, required this.seat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;

    IconData icon;

    switch (seat.status) {
      case SeatStatus.available:
        switch (seat.type) {
          case SeatType.regular:
            color = Colors.white;
            icon = Icons.square_outlined;
            break;
          case SeatType.vip:
            color = Colors.yellow;
            icon = Icons.square_outlined;
            break;
        }
        break;
      case SeatStatus.booked:
        switch (seat.type) {
          case SeatType.regular:
            color = Colors.grey[300]!;
            icon = Icons.square;
            break;
          case SeatType.vip:
            color = Colors.yellow.withOpacity(0.5);
            icon = Icons.square;
            break;
        }
        break;
    }

    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Icon(icon),
      ),
    );
  }
}

