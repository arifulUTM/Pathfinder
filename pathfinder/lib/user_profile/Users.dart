import 'package:firebase_auth/firebase_auth.dart';

class Users {
  FirebaseAuth firebase_auth = FirebaseAuth.instance;

  Users({this.firebase_auth});

  //SignUp with Email and Password

  Future<User> signUp(String email, String password) async {
    try {
      var auth = await firebase_auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      print(e.toString());
    }
  }

// SignIn with Email and Password

  Future<User> signIn(String email, String password) async {
    try {
      var auth = await firebase_auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return auth.user;
    } catch (e) {
      print(e.toString());
    }
  }

  // SignOut

  Future<void> signOut() async {
    firebase_auth.signOut();
  }

// Check Sign In

  Future<void> checkSignIn() async {
    var currentUser = await firebase_auth.currentUser;

    return currentUser != null;
  }

  // get currentUser

  Future<User> getCurrentUser() async {
    return await firebase_auth.currentUser;
  }
}
