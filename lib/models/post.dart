class Post {
  String? tenPhim;
  String? thoiLuong;
  String? khoiChieu;
  String? image;
  String? dienVien;
  String? daoDien;
  String? theLoai;
  String? kiemDuyet;
  String? ngonNgu;
  String? trailer;
  String? textTrailer;
  String? phong;
  String? id;


  Post({required this.tenPhim, this.thoiLuong, this.khoiChieu, this.image, this.dienVien, this.daoDien, this.theLoai, this.kiemDuyet, this.ngonNgu, this.trailer, this.textTrailer, this.phong, this.id
  });

  Post.fromJson(Map<String, dynamic> json){
    tenPhim = json['tenPhim'];
    thoiLuong = json['thoiLuong'];
    khoiChieu = json['khoiChieu'];
    image = json['image'];
    dienVien = json['dienVien'];
    daoDien = json['daoDien'];
    theLoai = json['theLoai'];
    kiemDuyet = json['kiemDuyet'];
    ngonNgu = json['ngonNgu'];
    trailer = json['trailer'];
    textTrailer = json['textTrailer'];
    phong = json['phong'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenPhim'] = this.tenPhim;
    data['thoiLuong'] = this.thoiLuong;
    data['khoiChieu'] = this.khoiChieu;
    data['image'] = this.image;
    data['dienVien'] = this.dienVien;
    data['daoDien'] = this.daoDien;
    data['theLoai'] = this.theLoai;
    data['kiemDuyet'] = this.kiemDuyet;
    data['ngonNgu'] = this.ngonNgu;
    data['trailer'] = this.trailer;
    data['textTrailer'] = this.textTrailer;
    data['phong'] = this.phong;
    data['id'] = this.id;
    return data;
  }
}