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
    id = json['id'] ?? null;
    comment_body = json['comment_body'] ?? null;
    commented_date = json['commented_date'] ?? null;
    user_id = json['user_id'] ?? null;
    post_id = json['post_id'] ?? null;
    user = json['user'] ?? null;
    userimage = json['userimage'] ?? null;
  }

  isNotNull() {
    return this.id != null &&
        this.comment_body != null &&
        this.commented_date != null &&
        this.user_id != null &&
        this.post_id != null &&
        this.user != null &&
        this.userimage != null;
  }
}
