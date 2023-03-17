import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vacua_app/models/users.dart';

// login services

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Login user
  // will only return a string if there is an error
  Future login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      DocumentSnapshot docSnap =
          await _db.collection("users").doc(user!.uid).get();
      if (docSnap.exists) {
        Map<String, dynamic>? data = docSnap.data() as Map<String, dynamic>;
        print(data);
        UserModel loginUser = UserModel.fromJson(data);
        // Todo: add the login User to state
      }
      // Todo - get user exra details and redirect to their respective screens
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw 'Invalid email or password';
      } else {
        throw 'There was a problem logging in. Pleas try again later';
      }
    }
  }

  Future Register(String email, String password, UserModel ruser) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      var doc_ref = _db.collection("users").doc(user!.uid);
      await doc_ref.set(ruser.toJson());
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
