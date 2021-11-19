import 'dart:convert';

class User {
  late int id;
  late String username;
  late String fullname;
  late String addressemail;
  late String phonenumber;
  late String imagepath;
  User(
      {required this.id,
      required this.username,
      required this.fullname,
      required this.addressemail,
      required this.phonenumber,
      required this.imagepath});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullname = json['fullname'];
    addressemail = json['address_email'];
    phonenumber = json['phone_number'];
    imagepath = json['imagepath'];
  }
}
