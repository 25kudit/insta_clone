import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMthods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //for user signup

  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    required String bio,
  }) async {
    String res = "";
    try {
      if (username.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'email': email,
          'uid': cred.user!.uid,
          'bio': bio,
          'followers': [],
          'following': [],
        });
      }
    } catch (err) {
      res = err.toString();
      print("hi error");
      print(err.toString());
    }
    return res;
  }
}
