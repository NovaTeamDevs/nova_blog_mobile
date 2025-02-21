import 'package:nova_blog_mobile/models/category_model.dart';

class PostModel {
  int? id;
  String? title;
  CategoryModel? category;
  Author? author;
  String? content;
  String? tags;
  String? image;
  bool? isLiked;
  bool? isBookmarked;
  String? createdAt;
  String? updatedAt;

  PostModel(
      {this.id,
        this.title,
        this.category,
        this.author,
        this.content,
        this.tags,
        this.image,
        this.isLiked,
        this.isBookmarked,
        this.createdAt,
        this.updatedAt});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    content = json['content'];
    tags = json['tags'];
    image = json['image'];
    isLiked = json['is_liked'];
    isBookmarked = json['is_bookmarked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}



class Author {
  int? id;
  String? fullName;
  String? avatar;

  Author({this.id, this.fullName, this.avatar});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    avatar = json['avatar'];
  }

}
