import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.userId,
    required this.id,
    required this.desc,
    required this.url,
  });

  int userId;
  int id;
  String desc;
  String url;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["customerId"],
    id: json["id"],
    desc: json["description"],
    url: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "customerId": userId,
    "id": id,
    "description": desc,
    "picture": url,
  };
}