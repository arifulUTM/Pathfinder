import 'package:firebase_auth/firebase_auth.dart';

class Users {
  FirebaseAuth firebase_auth = FirebaseAuth.instance;

  Users({this.firebase_auth});

  // Sign Up with email and password

  Future<User> signUp(String email, String password) async {
    try {
      var auth = await firebase_auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      print(e.toString());
    }
  }

  // Sign In with email and password

  Future<User> signIn(String email, String password) async {
    try {
      var auth = await firebase_auth.signInWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      print(e.toString());
    }
  }

  // Sign Out

  Future<void> signOut() async {
    await firebase_auth.signOut();
  }

  // check Sign In
  Future<bool> isSignedIn() async {
    var currentUser = await firebase_auth.currentUser;
    return currentUser != null;
  }

  //get current user

  Future<User> getUser() async {
    return await firebase_auth.currentUser;
  }
}
