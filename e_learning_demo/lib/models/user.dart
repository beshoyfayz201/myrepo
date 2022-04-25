class User {
  String? id;
  String? userName;
  String? password;
  String? email;
  String? token = "";

  User({
    this.id,
    this.email,
    this.password,
    this.userName,
    this.token,
  });
   
  Map<String, dynamic> toMap() {
    Map<String, String> map = {};
    if (id != null) map["ID"] = id!;
    if (email != null) map["email"] = email!;
    if (userName != null) map["user_login"] = userName!;
    if (password != null) map["password"] = password!;
    if (token != null) map["token"] = token!;
    return map;
  }

  fromUser(User? newUser) {
    id = newUser?.id;
    email = newUser?.email;
    password = newUser?.password;
    token = newUser?.token;
    userName = newUser?.userName;
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson["user"]["id"].toString(),
      userName: parsedJson["user"]["user_name"],
      email: parsedJson["user"]["email"],
      token: parsedJson["token"],
    );
  }

  factory User.fromSettingJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson["id"].toString(),
      userName: parsedJson["user_name"],
      email: parsedJson["email"],
      token: parsedJson["token"],
    );
  }
}
