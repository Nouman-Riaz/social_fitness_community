import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/modules/login/bloc/login_event.dart';

import '../../main.dart';
import '../signup/signup_view.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_state.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    color: Color(0xFF1D1A3D),
                  ),
                  child: const Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    ),
                  ),),
                SizedBox(
                  height: height * 0.07,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: TextFormField(
                    controller: emailController,
                    validator: (val) => val!.isEmpty ? "Enter email!" : null,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.email_outlined),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(35)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                BlocBuilder<LoginBloc, LoginBlocState>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                      child: TextFormField(
                        obscureText: !state.showPassword,
                        controller: passwordController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter password!";
                          } else if (val.length < 6) {
                            return "please enter more than 6 digits";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          icon: GestureDetector(
                              onTap: () {
                                context.read<LoginBloc>().add(ShowPasswordEvent());
                              },
                              child: const Icon(Icons.remove_red_eye_sharp)),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(35)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                SizedBox(
                  height: height * 0.12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: SizedBox(
                    width: width,
                    child: BlocConsumer<LoginBloc, LoginBlocState>(
                      listener: (context, state) {
                        if (state.authApiState == APIState.error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                'Error',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        } else if (state.authApiState == APIState.done) {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => UsersView(
                          //         email: emailController.text.trim()),
                          //   ),
                          // );
                        }
                      },
                      builder: (context, state) {
                        return FloatingActionButton(
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter your credentials')));
                            } else {
                              // context.read<LoginBloc>().login(
                              //   emailController.text.trim(),
                              //   passwordController.text.trim(),
                              // );
                            }
                          },
                          backgroundColor: const Color(0xFF1D1A3D),
                          child: Center(
                            child: state.authApiState == APIState.loading
                                ? const CircularProgressIndicator()
                                : const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have account?'),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpView(),
                            ),
                          );
                        },
                        child: const Text(
                          'Signup',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}