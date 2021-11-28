class Post {
  var id;
  var body;
  var posted_date;
  var user_id;
  var comments;
  var user;
  var likes;
  var isLiked;
  var userimage;

  Post(
      {required this.id,
      required this.body,
      required this.posted_date,
      required this.user_id,
      required this.isLiked,
      required this.comments,
      required this.likes,
      required this.user,
      required this.userimage});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? null;
    body = json['post_body'] ?? null;
    posted_date = json['posted_date'] ?? null;
    user_id = json['user_id'] ?? null;
    comments = json['comments'] ?? null;
    likes = json['likes'] ?? null;
    isLiked = json['isliked'] ?? null;
    user = json['user'] ?? null;
    userimage = json['userimage'] ?? null;
  }

  isNotNull() {
    return this.id != null &&
        this.posted_date != null &&
        this.user_id != null &&
        this.isLiked != null &&
        this.comments != null &&
        this.likes != null &&
        this.user != null &&
        this.userimage != null;
  }
}
