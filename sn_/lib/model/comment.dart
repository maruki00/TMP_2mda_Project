class Comment {
  var id;
  var comment_body;
  var commented_date;
  var user_id;
  var post_id;
  var user;
  var userimage;
  Comment(
      {required this.id,
      required this.comment_body,
      required this.commented_date,
      required this.user_id,
      required this.post_id,
      required this.user,
      required this.userimage});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment_body = json['comment_body'];
    commented_date = json['commented_date'];
    user_id = json['user_id'];
    post_id = json['post_id'];
    user = json['user'];
    userimage = json['userimage'];
  }
}
