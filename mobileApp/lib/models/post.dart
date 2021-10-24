import "package:sn/models/comment.dart";
import "package:sn/models/like.dart";
class postmodel{
  late var id;
  late var post_body;
  late var posted_date;
  late List<comment> commets;
  late List<like> likes;
}