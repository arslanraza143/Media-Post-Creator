import 'package:get/get.dart';

class AllPostResModel {
  List<Posts>? posts;
  int? total;
  int? skip;
  int? limit;

  AllPostResModel({this.posts, this.total, this.skip, this.limit});

  AllPostResModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Posts {
  int? id;
  String? title;
  String? body;
  List<String>? tags;
  Reactions? reactions;
  int? views;
  int? userId;
  String? name;
  final RxBool isLiked = false.obs;

  Posts(
      {this.id,
      this.title,
      this.body,
      this.tags,
      this.reactions,
      this.views,
      this.userId, this.name,});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    name = json['name'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'] != null
        ? Reactions.fromJson(json['reactions'])
        : null;
    views = json['views'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    data['body'] = body;
    data['tags'] = tags;
    if (reactions != null) {
      data['reactions'] = reactions!.toJson();
    }
    data['views'] = views;
    data['userId'] = userId;
    return data;
  }
}

class Reactions {
  int? likes;
  int? dislikes;

  Reactions({this.likes, this.dislikes});

  Reactions.fromJson(Map<String, dynamic> json) {
    likes = json['likes'];
    dislikes = json['dislikes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['likes'] = likes;
    data['dislikes'] = dislikes;
    return data;
  }
}
