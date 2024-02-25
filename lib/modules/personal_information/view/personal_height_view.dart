import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/modules/enthusiast_view/enthusiast_view.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_bloc.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_events.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../../main.dart';
import '../../common/common_button.dart';

class SelectHeightPage extends StatelessWidget {
  SelectHeightPage({Key? key, required this.name, required this.email}) : super(key: key);

  final String name;
  final String email;

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
            const Text('Whats your height?', style: TextStyle(
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
                choices: List.generate(201, (index) {
                  int height = index + 50; // Ranging from 50 to 250
                  return WheelChoice(value: height, title: '$height cm');
                }),
                onChoiceChanged: (s) {
                  context.read<PersonalInfoBloc>().add(UpdateHeight(height: int.parse(s.toString())));
                },
                startPosition: 50,
                selectTextStyle: const TextStyle(color: Colors.purple),
                unSelectTextStyle: const TextStyle(color: Colors.grey),
              ),
            ),
            CommonButton(height: height * 0.07, title: 'Next', onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EnthusiastView(name: name, email: email)));
            },)
          ],
        ),
      ),
    );
  }
}
