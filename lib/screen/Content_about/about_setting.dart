import 'package:flutter/material.dart';
import 'package:metiz_cinema/screen/about.dart';

class aboutSetting extends StatefulWidget {
  const aboutSetting({Key? key}) : super(key: key);

  @override
  State<aboutSetting> createState() => _aboutSettingState();
}

class _aboutSettingState extends State<aboutSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => About())), icon: Icon(Icons.arrow_back)),
        title: Text("ĐIỀU KHOẢN VÀ GIAO DỊCH", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
        ),
        ),
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
                  TextSpan(text: "Cảm ơn Quý khách đã tin tưởng sử dụng dịch vụ của "),
                  TextSpan(text: "Metiz Cinema.", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
                  TextSpan(text: " Khi truy cập trang web này có nghĩa là Quý khách đồng ý với các điều khoản về quy định, thay đổi, hiệu chỉnh hoặc lược bỏ trong quyền sử dụng. Vì vậy, xin vui lòng tìm hiểu kỹ trước khi Đặt vé trực tuyến. "),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text("1. Phạm vi áp dụng", style: TextStyle(
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
                    TextSpan(text: "  Những quy định dưới đây áp dụng riêng cho chức năng Đặt vé trực tuyến tại Website Metiz Cinema. Sử dụng chức năng này đồng nghĩa với việc quý khách chấp nhận các điều khoản về đặt chỗ mua vé cũng như các chỉ dẫn, điều khoản, điều kiện đã đăng tải trên Website. Nếu Quý khách không đồng ý với bất kì điều khoản nào, xin vui lòng dừng sử dụng chức năng này."),
                  ]
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text("2. Điều kiện sử dụng ", style: TextStyle(
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
                    TextSpan(text: "  Để sử dụng chức năng Đặt vé trực tuyến, Quý khách phải đăng kí tài khoản với những thông tin xác thực về bản thân và cập nhật khi có thay đổi. Các tài khoản đã đăng kí sẽ được công nhận là thành viên của "),
                    TextSpan(text: "Metiz Cinema ", style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    TextSpan(text: "và sở hữu bao gồm: tài khoản cá nhân, mật khẩu, các hoạt động giao dịch trên Website Metiz Cinema. Khi tài khoản có dấu hiệu bị truy cập trái phép, vui lòng thông báo ngay cho chúng tôi để được hướng dẫn xử lý kịp thời. Chúng tôi không chịu trách nhiệm với những thiệt hại, mất mát về tài khoản do quý khách không tuân thủ quy định hoặc thông báo chậm trễ. ")
                  ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text("3. Quy định về Đặt vé trực tuyến ", style: TextStyle(
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
                    TextSpan(text: "- Tính năng đặt vé trực tuyến trên chỉ dành cho thành viên "),
                    TextSpan(text: "Metiz Cinema ", style: TextStyle(
                        fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                    TextSpan(text: "- Tất cả các phim tại "),
                    TextSpan(text: "Metiz Cinema ", style: TextStyle(
                        fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                    TextSpan(text: "đều được mở bán vé trực tuyến trước ngày công chiếu chính thức. Nếu bạn muốn mua vé suất chiếu chưa được hiển thị trên website, vui lòng liên hệ Hotline 0236 3630 689 để được tư vấn. \n- Thời gian đóng chức năng đặt vé trực tuyến là 15 phút trước giờ chiếu phim. Ngoài thời gian này, quý khách vui lòng liên hệ trực tiếp tại rạp để mua vé. \n- Thời gian một phiên đặt vé kể từ lúc quý khách bắt đầu chọn ghế là 5 phút. Sau thời gian này, số hế đã chọn của quý khách sẽ bị hủy. Quý khách có thể đặt tối đa 8 chỗ trong mỗi lần giao dịch. \n- Trước khi tiến thành các bước thanh toán, Quý khách vui lòng kiểm tra kỹ các thông tin về rạp chiếu, tên phim, số ghế, giờ chiếu và số tiền. Sau khi xác nhận thông tin đặt vé, quý khách bấm vào ô “Thanh toán” để thực hiện giao dịch. Mã xác nhận đặt vé của Quý khách sẽ được gửi về số điện thoại và Email (theo đăng kí thông tin thành viên). \n- Nếu Quý khách không nhận được tin nhắn xác nhận đặt vé và mã giao dịch, vui lòng kiểm tra thông tin số điện thoại cung cấp (trong thông tin đăng kí thành viên) trước khi liên lạc với"),
                    TextSpan(text: "Metiz Cinema ", style: TextStyle(
                        fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                    TextSpan(text: " Email xác nhận thông tin đặt vé của Quý khách có thể bị chuyển vào Hộp thư rác (Spam), quý khách vui lòng kiểm tra trong trường hợp không nhận được email xác nhận đặt vé.\n- Quý khách không thể thay đổi số ghế, suất chiếu khi đã xác nhận đặt vé và thanh toán giao dịch. Tuy nhiên, trong những trường hợp bất khả kháng xảy ra liên quan đến thay đổi chương trình; trục trặc kỹ thuật, phần mềm; sự cố về phần cứng, cơ sở vật chất, "),
                    TextSpan(text: "Metiz Cinema ", style: TextStyle(
                        fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                    TextSpan(text: "có quyền hoàn trả lại vé (trong trường hợp hủy suất chiếu) hoặc thực hiện đổi, chuyển vé của bạn qua suất chiếu khác theo yêu cầu của khách hàng."),
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
