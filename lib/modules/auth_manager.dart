import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';

class AuthManager extends ChangeNotifier {
  bool isLoggedIn = false;
  bool isSignupCompleted = false;

  AuthManager() {
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSignupCompleted = prefs.getBool('signupCompleted') ?? false;
    isLoggedIn = user != null && isSignupCompleted;
    notifyListeners();
  }

  Future<void> setSignupCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('signupCompleted', true);
    isSignupCompleted = true;
    notifyListeners();
  }
  Future<void> setLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedinCompleted', true);
    isLoggedIn = true;
    notifyListeners();
  }
  Future<void> setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    isLoggedIn = true;
    notifyListeners();
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    isLoggedIn = true;
    notifyListeners();
    return email;
  }

  Future<void> logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut().then((value) {
      Utils().toastMessage("Logout successfully");
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('signupCompleted', false);
    isLoggedIn = false;
    isSignupCompleted = false;
    notifyListeners();
  }
}
