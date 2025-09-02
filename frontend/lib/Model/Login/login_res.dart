// class LoginResModel {
//   String? token;
//   UserModel? user;

//   LoginResModel({this.token, this.user});
//   LoginResModel.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['token'] = token;
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     return data;
//   }
// }

// class UserModel {
//   int? id;
//   String? name;
//   String? email;
//   UserModel({this.id, this.name, this.email});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['email'] = email;
//     return data;
//   }
// }

class LoginResModel {
  String? accessToken;
  String? refreshToken;
  UserModel? user;

  LoginResModel({this.accessToken, this.refreshToken, this.user});

  factory LoginResModel.fromJson(Map<String, dynamic> json) {
    return LoginResModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      user: UserModel.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    if (user != null) {
      data.addAll(user!.toJson()); // Merge user fields
    }
    return data;
  }
}
class UserModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
    };
  }
}
