import 'package:vacua_app/models/users.dart';
import 'package:dio/dio.dart';

// login services

class AuthServices {
  final _dio =
      Dio(BaseOptions(baseUrl: "http://157.230.108.191/v1/api/console"));
  // Login user
  // will only return a string if there is an error
  Future login(String email, String password) async {
    var data = {"email": email, "password": password};
    try {
      Response res = await _dio.post("/auth/login", data: data);
      if (res.statusCode == 200) {
        print(res.data);
        return res.data;
      } else {
        throw Exception("Invalid email or password");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("There was a problem logging in");
    }
  }

  Future Register(String email, String password, UserModel ruser) async {
    try {
      //Todo - register with api
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      //Todo - Signout with api
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
