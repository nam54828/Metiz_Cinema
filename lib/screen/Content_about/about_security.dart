import 'package:flutter/material.dart';
import 'package:metiz_cinema/screen/about.dart';

class security extends StatefulWidget {
  const security({Key? key}) : super(key: key);

  @override
  State<security> createState() => _securityState();
}

class _securityState extends State<security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("CHÍNH SÁCH BẢO MẬT", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14),),
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => About())), icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.white, ),
                  children: <TextSpan>[
                    TextSpan(text: "Chào mừng bạn đến với Website chính thức của Metiz Cinema "),
                    TextSpan(text: "wwww.metiz.vn.", style: TextStyle(
                      color: Colors.red,
                    )),
                    TextSpan(text: " Việc sử dụng website này đồng nghĩa với việc bạn đồng ý theo những thỏa thuận dưới đây. Nếu bạn không đồng ý, xin vui lòng ngưng sử dụng website."),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text("1. Rủi ro cá nhân khi truy cập", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  ),
                ],
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: TextStyle(fontSize: 16,  color: Colors.white,),
                    children: <TextSpan>[
                      TextSpan(text: "  Khi truy cập trang web này, bạn đồng ý chấp nhận mọi rủi ro. "),
                      TextSpan(text: "Metiz Cinema ", style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                      TextSpan(text: "cũng như các bên đối tác xây dựng trang web sẽ không chịu trách nhiệm về bất kỳ tổn thất nào do hậu quả trực tiếp, hay gián tiếp; những thất thoát, chi phí (bao gồm chi phí pháp lý, chi phí tuư ấn hoặc các khoản chi tiêu khác) có thể phát sinh trực tiếp hay gián tiếp do truy cập trang web hoặc tải dữ liệu về máy; những tổn hại gặp phải do virus, hành động phá hoại trực tiếp hay gián tiếp của hệ thống máy tính khác, đường dây điện thoại, phần cứng, phần mềm, các lỗi kỹ thuật khác gây cản trở việc truyền tải qua máy vi tính hoặc kết nối mạng."),
                    ]
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text("2. Sử dụng thông tin", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  ),
                ],
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.white,),
                  children: <TextSpan>[
                    TextSpan(text: "  Mọi thông tin, dữ liệu cá nhân bạn chuyển đến trang web này dưới bất kỳ lí do, hình thức nào đều trở thành tài sản của "),
                    TextSpan(text: "Metiz Cinema ", style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    TextSpan(text: "và sẽ được bảo mật. Thông tin của bạn sẽ chỉ được sử dụng với mục đích liên lạc hoặc cập nhật lịch chiếu, khuyến mại của "),
                    TextSpan(text: "Metiz Cinema ", style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    TextSpan(text: "qua email hoặc bưu điện.")
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text("3. Quyền sử dụng của thành viên ", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  ),
                ],
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: TextStyle(fontSize: 16,  color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(text: "  Thành viên tham gia website"),
                      TextSpan(text: "Metiz Cinema ", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                      TextSpan(text: "không được đăng tải những nội dung hình ảnh, từ ngữ mang tính khiêu dâm, đồi trụy, tục tĩu; phỉ báng hoặc hăm dọa người khác; vi phạm luật pháp hoặc dẫn tới trách nhiệm pháp lý. Metiz Cinema sẽ không chịu trách nhiệm hay có nghĩa vụ đối với các nội dung này và sẽ phối hợp với pháp luật nếu được yêu cầu."),
                     ]
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text("4.Nôi dung", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  ),
                ],
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    style: TextStyle(fontSize: 16,  color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(text: "Metiz Cinema ", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                      TextSpan(text: "là một website được cung cấp vì lợi ích của khách hàng và mang tính phi thương mại. Tất cả những thông tin được đăng đều phản ánh trung thực tính chất của sự việc, tuy nhiên Metiz Cinema và các bên liên quan không đảm bảo tính chính xác, độ tin cậy cũng như việc sử dụng kết quả của sự việc trên trang web."),
                      TextSpan(text: "Metiz Cinema ", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                      TextSpan(text: "luôn cố gắng cập nhật thường xuyên nội dung trang website cũng như luôn có thể thay đổi bất kì lúc nào để phù hợp.")
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
