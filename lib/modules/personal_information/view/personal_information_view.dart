import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_bloc.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_events.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_state.dart';

class PersonalInformationView extends StatelessWidget {
  PersonalInformationView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  final types = ['Fitness Enthusiast', 'Fitness Professional'];

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.07,
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
                height: height * 0.12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: CustomTextField(controller: nameController, hintText: 'Enter Name'),
              ),
              // BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
              //   builder: (context, state){
              //     return DropdownButton(
              //       hint: Text(state.type),
              //       items: types
              //       .map((item) => DropdownMenuItem<String>(
              //     value: item,
              //     child: Text(
              //       item,
              //       overflow: TextOverflow.ellipsis,
              //     ),
              //   )).toList(),
              //     onChanged: (value){
              //       context.read<PersonalInfoBloc>().add(UpdateType(type: value!));
              //     },);},
              // ),
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

