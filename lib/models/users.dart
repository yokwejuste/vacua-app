import "dart:convert";

import "package:flutter/foundation.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";

class UserModel {
  late String id;
  final String token;
  late String email;
  late String fullName;

  final storage = new FlutterSecureStorage();

  UserModel({
    required this.id,
    required this.token,
    required this.email,
    required this.fullName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']['id'],
      token: json['access_token'],
      email: json['user']['email'],
      fullName: json['user']['full_name'],
    );
  }

  factory UserModel.fromSecureStorage(String userString) {
    Map<String, dynamic> userJson = jsonDecode(userString);

    return UserModel(
      id: userJson['id'],
      token: userJson['token'],
      email: userJson['email'],
      fullName: userJson['full_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "token": token,
      "email": email,
      "fullName": fullName,
    };
  }

  static bool validateEmail(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (email.isEmpty || !regex.hasMatch(email)) {
      return false;
    }
    return true;
  }

  //write to secure storage
  Future saveToSecureStore() async {
    await storage.write(key: "user", value: jsonEncode(toJson()));
  }

  // delete user from secure storage
  Future deleteFromSecureStore() async {
    await storage.delete(key: "user");
  }
}
