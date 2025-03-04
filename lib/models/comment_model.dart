class CommentModel {
  String? fullName;
  String? email;
  String? comment;

  CommentModel({this.fullName, this.email, this.comment});

  CommentModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    comment = json['comment'];
  }

}
