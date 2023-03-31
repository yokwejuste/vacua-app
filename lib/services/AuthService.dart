import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vacua_app/main.dart';
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
        UserModel user = UserModel.fromJson(res.data);
        return user;
      } else {
        throw Exception("Invalid email or password");
      }
    } on DioError catch (e) {
      print(e.response);
      if (e.response?.statusCode == 400) {
        throw Exception("Invalid email or password");
      } else {
        throw Exception("There was a problem logging in");
      }
    } catch (e) {
      print(e.toString());
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
  Future signOut(BuildContext context, WidgetRef ref) async {
    UserModel user = ref.read(userProvider)!;
    Map<String, String> data = {"token": user.token, "message": "logout"};
    try {
      await _dio.post("/auth/logout", data: data);
      await user.deleteFromSecureStore();
      ref.read(userProvider.notifier).state = null;
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    } catch (e) {
      throw Exception("There was a problem logging out");
    }
  }
}
