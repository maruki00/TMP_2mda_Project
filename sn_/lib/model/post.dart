class Post {
  var id;
  var body;
  var posted_date;
  var user_id;
  var comments;
  var likes;
  var isLiked;

  Post(
      {required this.id,
      required this.body,
      required this.posted_date,
      required this.user_id,
      required this.isLiked,
      required this.comments,
      required this.likes});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['post_body'];
    posted_date = json['posted_date'];
    user_id = json['user_id'];
    comments = json['comments'];
    likes = json['likes'];
    isLiked = json['isliked'];
  }
}
