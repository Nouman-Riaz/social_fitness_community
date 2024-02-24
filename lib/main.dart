import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import 'package:softech/modules/login/bloc/login_bloc.dart';
import 'package:softech/modules/personal_information/view/personal_name_view.dart';
import 'package:softech/modules/signup/bloc/signup_bloc.dart';
import 'package:softech/modules/splash/splash_view.dart';

import 'modules/auth_manager.dart';
import 'modules/enthusiast_view/bloc/enthusiast_bloc.dart';
import 'modules/fitness_professional/bloc/professional_bloc.dart';
import 'modules/personal_information/bloc/personal_info_bloc.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
  // runApp(MultiProvider(
  //   providers: [ChangeNotifierProvider(
  //       create: (context) => SettingsManager(isDarkTheme: isDarkTheme)),
  //   ],
  //   child: MyApp(),
  // ),);
  // runApp(MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthManager(),
      child: MyApp(),
    ),
  );
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
