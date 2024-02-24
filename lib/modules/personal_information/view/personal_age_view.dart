import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/modules/common/common_button.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_bloc.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_events.dart';
import 'package:softech/modules/personal_information/view/personal_weight_view.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../../main.dart';

class SelectAgePage extends StatefulWidget {
  const SelectAgePage({Key? key}) : super(key: key);

  @override
  State<SelectAgePage> createState() => _SelectAgePageState();
}

class _SelectAgePageState extends State<SelectAgePage> {

  FixedExtentScrollController fixedExtentScrollController =
  FixedExtentScrollController();
  List<int> numbers = List.generate(100, (index) => 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.07,
              ),
              const Text('How old are you?', style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black,
                fontSize: 22,
              ),),
              const Text('This helps us create your personalised plan',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 13,
                ),),
              Expanded(
                child: WheelChooser.integer(
                  onValueChanged: (s) {
                    context.read<PersonalInfoBloc>().add(UpdateAge(age: int.parse(s.toString())));
                  },
                  maxValue: 100,
                  minValue: 15,
                  initValue: 18,
                  selectTextStyle: const TextStyle(color: Colors.purple),
                  unSelectTextStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              CommonButton(height: height * 0.07, title: 'Next', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectWeightPage()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
