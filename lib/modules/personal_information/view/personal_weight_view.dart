import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_events.dart';
import 'package:softech/modules/personal_information/view/personal_height_view.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../../main.dart';
import '../../common/common_button.dart';
import '../bloc/personal_info_bloc.dart';

class SelectWeightPage extends StatelessWidget {
  SelectWeightPage({Key? key, required this.name}) : super(key: key);

  final String name;

  FixedExtentScrollController fixedExtentScrollController =
  FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            const Text('Whats your weight?', style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: 22,
            ),),
            const Text('This helps us create your personalised plan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 13,
              ),),
            Expanded(
              child: WheelChooser.choices(
                choices: List.generate(250, (index) {
                  int weight = index + 25; // Ranging from 50 to 250
                  return WheelChoice(value: weight, title: '$weight kg');
                }),
                onChoiceChanged: (s) {
                  context.read<PersonalInfoBloc>().add(UpdateWeight(weight: int.parse(s.toString())));
                },
                startPosition: 40,
                selectTextStyle: const TextStyle(color: Colors.purple),
                unSelectTextStyle: const TextStyle(color: Colors.grey),
              ),
            ),
            CommonButton(height: height * 0.07, title: 'Next', onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SelectHeightPage(name: name)));
            },)
          ],
        ),
      ),
    );
  }
}
