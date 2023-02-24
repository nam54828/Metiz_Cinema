class postNews {
  String? header;
  String? time;
  String? image;
  String? content;
  String? dieuKhoan;
  String? id;

  postNews(
      {this.header,
        this.time,
        this.image,
        this.content,
        this.dieuKhoan,
        this.id});

  postNews.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    time = json['time'];
    image = json['image'];
    content = json['content'];
    dieuKhoan = json['dieuKhoan'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['time'] = this.time;
    data['image'] = this.image;
    data['content'] = this.content;
    data['dieuKhoan'] = this.dieuKhoan;
    data['id'] = this.id;
    return data;
  }
}