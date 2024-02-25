import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:softech/modules/login/bloc/login_state.dart';
import 'package:softech/modules/login/login_view.dart';
import 'package:softech/modules/profile/bloc/profile_bloc.dart';
import 'package:softech/modules/profile/bloc/profile_event.dart';
import 'package:softech/modules/profile/bloc/profile_state.dart';

import '../auth_manager.dart';
import '../settings/setting_screen.dart';
import 'home_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  Future getProfile() async {
    final authManager = Provider.of<AuthManager>(context, listen: false);
    final email = await authManager.getEmail();
    BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent(email!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if(state.apiState == APIState.loading){
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 30,
                          fontWeight: FontWeight.bold// You can adjust the font size as needed
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 12,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: const Text("Name", style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,),),
                      subtitle: Text(state.model?.name ?? 'nil',style: const TextStyle(color: Colors.black,),),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 12,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: const Text("Age",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,),),
                      subtitle: Text('${state.model?.age}',style: TextStyle(color: Colors.black,),),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 12,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: const Text("Height",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,),),
                      subtitle: Text("${state.model?.height} cm",style: TextStyle(color: Colors.black,),),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 12,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text("Weight", style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,),),
                      subtitle: Text("${state.model?.weight} kg",style: TextStyle(color: Colors.black,),),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 12,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text("Location",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,),),
                      subtitle: Text((state.model?.location == '' ? 'nil' : (state.model?.location ?? 'nil')),style: TextStyle(color: Colors.black,),),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Other',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 30,
                          fontWeight: FontWeight.bold// You can adjust the font size as needed
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 12,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.fitness_center_outlined,color: Colors.black,),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(name: state.model?.name ?? 'nil')));
                      },
                      title: const Text("Workout & Sessions", style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,),),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 12,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.settings,color: Colors.black,),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SettingsScreen()));
                      },
                      title: const Text("Setting", style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,),),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 12,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.logout_outlined,color: Colors.black,),
                      onTap: () {
                        logoutPopup();
                      },
                      title: const Text("Logout", style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,),),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Future<void> logoutPopup() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure to logout?'),
            content: Container(
              height: 5,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    auth.signOut().then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginView()));
                    }).onError((error, stackTrace) {
                      //Utils().toastMessage(error.toString());
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No')),
            ],
          );
        });
  }
}
