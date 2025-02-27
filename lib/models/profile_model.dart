class ProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? avatar;
  String? email;

  ProfileModel(
      {this.id, this.firstName, this.lastName, this.avatar, this.email});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    email = json['email'];
  }

}
