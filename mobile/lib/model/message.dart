class Message {
  var id;
  var message;
  var messaged_date;
  var user_id_from;
  var user_id_to;
  var user;
  var userimage;
  var user_to;
  var userimage_to;

  Message(
      {required this.id,
      required this.message,
      required this.messaged_date,
      required this.user_id_from,
      required this.user_id_to,
      required this.user,
      required this.userimage,
      required this.user_to,
      required this.userimage_to});

  Message.FromJsom(Map<String, dynamic> data) {
    id = data['id'];
    message = data['message'];
    messaged_date = data['messaged_date'];
    user_id_from = data['user_id_from'];
    user_id_to = data['user_id_to'];
    user = data['user'];
    userimage = data['userimage'];
    user_to = data['user_to,'];
    userimage_to = data['userimage_to'];
  }

  isNotNull() {
    return this.id != null &&
        this.message != null &&
        this.messaged_date != null &&
        this.user_id_from != null &&
        this.user_id_to != null &&
        this.user != null &&
        this.userimage != null &&
        this.user_to != null &&
        this.userimage_to != null;
  }
}
