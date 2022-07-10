class User {
  String? user_Id;
  String? first_name;
  String? last_name;
  String? age;
  String? gender;
  String? location;
  String? education;
  String? email;
  String? password;
  String? datereg;

  User(
      {this.user_Id,
      this.first_name,
      this.last_name,
      this.age,
      this.gender,
      this.location,
      this.education,
      this.email,
      this.datereg});

  User.fromJson(Map<String, dynamic> json) {
    user_Id = json["user_Id"];
    first_name = json["first_name"];
    last_name = json['last_name'];
    age = json['age'];
    gender = json['gender'];
    location = json['location'];
    education = json['education'];
    email = json['email'];
    datereg = json['datereg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_Id'] = user_Id;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['age'] = age;
    data['gender'] = gender;
    data['location'] = location;
    data['education'] = education;
    data['email'] = email;
    data['datereg'] = datereg;
    return data;
  }
}
