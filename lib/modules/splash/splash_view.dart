import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softech/modules/bottom_bar/bottom_bar.dart';
import 'package:softech/modules/enthusiast_view/enthusiast_view.dart';
import 'package:softech/modules/fitness_professional/fitness_professional_view.dart';
import 'package:softech/modules/login/login_view.dart';
import 'package:softech/modules/personal_information/view/personal_age_view.dart';
import 'package:softech/modules/personal_information/view/personal_gender_view.dart';
import 'package:softech/modules/personal_information/view/personal_height_view.dart';
import 'package:softech/modules/personal_information/view/personal_name_view.dart';
import 'package:softech/modules/personal_information/view/personal_type_view.dart';
import 'package:softech/modules/personal_information/view/personal_weight_view.dart';

import '../../main.dart';
import '../auth_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // FirebaseAuth auth = FirebaseAuth.instance;
    // final user = auth.currentUser;
    // debugPrint("User Email ======>>>>");
    // debugPrint(user!.email);
    // if(user!=null) {
    //   Timer(
    //       const Duration(seconds: 2),
    //           () => Navigator.pushReplacement(
    //           context, MaterialPageRoute(builder: (context) => CustomBottomBar())));
    // }
    // else{
    //   Timer(
    //       const Duration(seconds: 2),
    //           () => Navigator.pushReplacement(
    //           context, MaterialPageRoute(builder: (context) => LoginView())));
    // }
    Future.delayed(const Duration(seconds: 2), () {
      checkLoginStatus();
    });

  }
  void checkLoginStatus() {
    final authManager = Provider.of<AuthManager>(context, listen: false);
    if (authManager.isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomBar()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Center(
            child: Image.asset(
              'assets/barbell.png',
              width: width * 0.5,
              height: height * 0.2,
            )),
      ),
    );
  }
}