import 'dart:async';

import 'package:flutter/material.dart';
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

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ProfessionalView()));
    });
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