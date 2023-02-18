import 'package:firebase_auth/firebase_auth.dart';

// login services

class AuthServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login user
  // will only return a string if there is an error
  Future login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      // Todo - get user exra details and redirect to their respective screens
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found' || e.code == 'wrong-password'){
        return 'Invalid email or password';
      } else {
        return 'There was a problem logging in. Pleas try again later';
      }
    }
  }

  Future Register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
} 