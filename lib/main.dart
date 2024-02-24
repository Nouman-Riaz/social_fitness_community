import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/modules/enthusiast_view/bloc/enthusiast_bloc.dart';
import 'package:softech/modules/fitness_professional/bloc/professional_bloc.dart';
import 'package:softech/modules/login/bloc/login_bloc.dart';
import 'package:softech/modules/personal_information/view/personal_name_view.dart';
import 'package:softech/modules/signup/bloc/signup_bloc.dart';
import 'package:softech/modules/splash/splash_view.dart';

import 'modules/personal_information/bloc/personal_info_bloc.dart';

void main() {
  runApp(const MyApp());
}

late double width;
late double height;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PersonalInfoBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => EnthusiastBloc()),
        BlocProvider(create: (context) => ProfessionalBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
