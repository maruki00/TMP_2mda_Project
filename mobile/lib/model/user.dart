class User {
  late var id;
  late var username;
  late var fullname;
  late var addressemail;
  late var phonenumber;
  late var imagepath;
  late var lastaccess;
  late var isfollow;
  User({
    required this.id,
    required this.username,
    required this.fullname,
    required this.addressemail,
    required this.phonenumber,
    required this.imagepath,
    required this.lastaccess,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullname = json['fullname'];
    addressemail = json['address_email'];
    phonenumber = json['phone_number'];
    imagepath = json['imagepath'];
    lastaccess = json['lastaccess'];
    isfollow = json['isfollow'] ?? "";
  }

  isNotNull() {
    return this.id != null &&
        this.username != null &&
        this.fullname != null &&
        this.addressemail != null &&
        this.phonenumber != null &&
        this.imagepath != null;
  }
}
