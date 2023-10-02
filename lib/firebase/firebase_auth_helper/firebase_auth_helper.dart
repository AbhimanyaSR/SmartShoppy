import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/constants.dart';
import 'package:smart_shopy/models/user_model/user_model.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  //! For Log in
  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      showMessage(error.code.toString());
      Navigator.of(context).pop();
      return false;
    }
  }

  //! For Sign up
  Future<bool> signup(
    String name,
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      showLoaderDialog(context);
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
      );

      // _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
      _firestore.collection("users").doc(userModel.id).set(userModel.toJson());

      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      showMessage(error.code);
      Navigator.of(context).pop();
      return false;
    }
  }

  //! For Log out
  signOut() async {
    await _auth.signOut();
  }
}
