import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/modules/signup/bloc/signup_event.dart';

import '../../main.dart';
import '../login/login_view.dart';
import 'bloc/signup_bloc.dart';
import 'bloc/signup_state.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(color: Color(0xFF1D1A3D)),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height * 0.18,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text(
                      'SIGNUP',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: emailController,
                    validator: (val) => val!.isEmpty ? "Enter email!" : null,
                    decoration: InputDecoration(
                      icon:
                          const Icon(Icons.email_outlined, color: Colors.white),
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.white),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(35)),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                BlocBuilder<SignUpBloc, SignUpBlocState>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
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
                          icon: InkWell(
                              onTap: () {
                                context
                                    .read<SignUpBloc>()
                                    .add(ShowPasswordEvent());
                              },
                              child:
                                  const Icon(Icons.lock, color: Colors.white)),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(35)),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                BlocBuilder<SignUpBloc, SignUpBlocState>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: confirmPasswordController,
                        obscureText: !state.showConfirmPassword,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter password!";
                          } else if (val.length < 6) {
                            return "please enter more than 6 digits";
                          } else if (confirmPasswordController.text !=
                              passwordController.text) {
                            return "Password didn\'t matched";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          icon: InkWell(
                              onTap: () {
                                context
                                    .read<SignUpBloc>()
                                    .add(ShowConfirmPasswordEvent());
                              },
                              child:
                                  const Icon(Icons.lock, color: Colors.white)),
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(35)),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: SizedBox(
                    width: width,
                    child: BlocConsumer<SignUpBloc, SignUpBlocState>(
                        listener: (context, state) {
                      if (state.registerApiState == Event.error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              state.errorMessage,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      } else if (state.registerApiState == Event.done) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      }
                    }, builder: (context, state) {
                      return FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () async {
                            if (!formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Enter your credentials')));
                            } else {
                              //   context.read<SignUpBloc>().register(
                              //       emailController.text,
                              //       nameController.text,
                              //       passwordController.text,
                              //       confirmPasswordController.text);
                            }
                          },
                          child: Center(
                              child: state.registerApiState == Event.loading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      'Signup',
                                      style:
                                          TextStyle(color: Color(0xFF1D1A3D)),
                                    )));
                    }),
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
                      const Text(
                        'Already have account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: width * 0.08,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView()));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.blue),
                          )),
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
      )),
    );
  }
}
