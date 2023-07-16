import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/resources/storage_mathods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for user signup
  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    required String bio,
    required Uint8List image,
  }) async {
    String res = "";
    try {
      if (username.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        final profilePicURL = await storageMethods().uploadImageToStorage(
            childName: 'profilePics', img: image, ispost: false);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'email': email,
          'uid': cred.user!.uid,
          'bio': bio,
          'profilePicURL': profilePicURL,
          'followers': [],
          'following': [],
        });

        res = 'success';
        print(res + ' ' + cred.user!.uid);
      }
    } catch (err) {
      res = err.toString();
      print("hi error $res");
    }
    return res;
  }

  //login user
  Future<String> signinUser({required String email, required String password}) async {
    String res = "an error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "success";
      } else {
        res = "enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
