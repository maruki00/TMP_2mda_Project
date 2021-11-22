class Message {
  var id;
  var message;
  var messaged_date;
  var user_id_from;
  var user_id_to;
  var user;
  var userimage;

  Message(
      {required this.id,
      required this.message,
      required this.messaged_date,
      required this.user_id_from,
      required this.user_id_to,
      required this.user,
      required this.userimage});

  Message.FromJsom(Map<String, dynamic> data) {
    id = data['id'];
    message = data['message'];
    messaged_date = data['messaged_date'];
    user_id_from = data['user_id_from'];
    user_id_to = data['user_id_to'];
    user = data['user'];
    userimage = data['userimage'];
  }
}
