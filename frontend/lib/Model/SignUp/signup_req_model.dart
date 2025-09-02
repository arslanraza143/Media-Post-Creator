class SignUpReqModel {
  String? username;
  String? email;
  String? name;
  String? password;
  String? age;

  SignUpReqModel(
      {this.username, this.email, this.name,  this.password, this.age});

  SignUpReqModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    data['age'] = age;
    return data;
  }
}
