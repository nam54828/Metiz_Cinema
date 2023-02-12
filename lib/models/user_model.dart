import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullname;
  final String password;
  final String cmnd;
  final String birthday;
  final String city;
  final String district;
  final String email;
  final String phone;

  const UserModel({
    this.id,
    required this.fullname,
    required this.password,
    required this.cmnd,
    required this.birthday,
    required this.city,
    required this.district,
    required this.email,
    required this.phone
});
  toJson(){
return {"FullName": fullname, "Email": email,
"Password": password, "cmnd": cmnd, "birthday": birthday,
"city": city, "district": district, "phone": phone};
  }
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
      id: document.id,
        fullname: data["Email"],
        password: data["Password"],
        cmnd: data["cmmd"],
        birthday: data["birthday"],
        city: data["city"],
        district: data["district"],
        email: data["Email"],
        phone: data["phone"]);
  }

}