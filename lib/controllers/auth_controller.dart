import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/screens/screens.dart';
import 'package:movie_booking_app/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLoging = false;

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(
      Duration(seconds: isLoging ? 0 : 2),
      () {
        if (user == null) {
          isLoging = false;
          update();
          Get.offAll(() => const LoginScreen());
        } else {
          isLoging = true;
          update();
          Get.offAll(() => const HomeScreen());
        }
      },
    );
  }

  void registerUser(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar('Account Creating Failed', e);
    }
  }

  void login(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar('Login Failed', e);
    }
  }

  void googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    isLoging = true;
    update();
    try {
      googleSignIn.disconnect();
    } catch (e) {}
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;
        final AuthCredential credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await auth.signInWithCredential(credentials);
      }
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar('Google Login Failed', e);
    }
  }

  getErrorSnackBar(String message, _) {
    Get.snackbar(
      'Error',
      '$message\n${_.message}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ThemeColor.redBorder,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  void signOut() async {
    await auth.signOut();
  }
}
