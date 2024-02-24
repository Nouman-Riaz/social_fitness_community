import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:softech/modules/common/common_button.dart';
import 'package:softech/modules/personal_information/view/personal_type_view.dart';

import '../../../main.dart';

class PersonalInformationView extends StatelessWidget {
  PersonalInformationView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  final types = ['Fitness Enthusiast', 'Fitness Professional'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.09,
              ),
              const Text('Whats Your Name?', style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black,
                fontSize: 22,
              ),),
              const Text('What are you called by in your community',
                style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 13,
              ),),
              SizedBox(
                height: height * 0.19,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: CustomTextField(controller: nameController, hintText: 'Enter Name', validator: (val){
                  if(val!.isEmpty){
                    return 'Please enter your name';
                  }
                  return null;
                },),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: CommonButton(height: height * 0.07, title: 'Next', onTap: (){
                  if(!formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter your name')));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalTypeView()));
                  }
                },),
              ),
              SizedBox(
                height: height * 0.08,
              ),
            ],
          )),
          ),
        ),
      );
  }
}



class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.controller, this.validator, required this.hintText}) : super(key: key);

  TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).hintColor,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

