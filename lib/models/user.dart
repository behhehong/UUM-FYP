class User {
  String? first_name;
  String? last_name;
  String? email;
  String? password;
  String? datereg;

  User({this.first_name, this.last_name, this.email, this.password, this.datereg});

  User.fromJson(Map<String, dynamic> json) {
    first_name = json["first_name"];
    last_name = json['last_name'];
    email = json['email'];
    password = json['password'];
    datereg = json['datereg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['email'] = email;
    data['password'] = password;
    data['datereg'] = datereg;
    return data;
  }
}
