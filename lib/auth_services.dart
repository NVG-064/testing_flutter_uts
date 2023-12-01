import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signOut() async {
    print('Before sign out: ${_auth.currentUser}');
    _auth.signOut();
    print('After sign out: ${_auth.currentUser}');
  }

  static Future<void> signUpFirebase(
      String email, String password, BuildContext context) async {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  static Stream<User?> get firebaseUserStream => _auth.authStateChanges();
}
