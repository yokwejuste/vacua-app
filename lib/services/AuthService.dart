import 'package:vacua_app/models/users.dart';

// login services

class AuthServices {
  // Login user
  // will only return a string if there is an error
  Future login(String email, String password) async {
    try {
      //Todo - login with api
      // Todo - get user exra details and redirect to their respective screens
    } catch (e) {
      print(e);
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
