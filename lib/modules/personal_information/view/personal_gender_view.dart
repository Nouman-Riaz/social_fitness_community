import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_bloc.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_events.dart';
import 'package:softech/modules/personal_information/view/personal_age_view.dart';

import '../../../main.dart';
import '../../common/common_button.dart';
import '../bloc/personal_info_state.dart';

class SelectGenderPage extends StatefulWidget {
  const SelectGenderPage({Key? key, required this.name, required this.email}) : super(key: key);

  final String name;
  final String email;

  @override
  State<SelectGenderPage> createState() => _SelectGenderPageState();
}

class _SelectGenderPageState extends State<SelectGenderPage> {

  Color maleButtonColor = Colors.grey;
  Color femaleButtonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            const Text('Tell us about yourself!', style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: 22,
            ),),
            const Text('To give you a better experience we need to know your gender',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 13,
              ),),
            SizedBox(
              height: height * 0.07,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  maleButtonColor = Colors.purple;
                  femaleButtonColor = Colors.grey;
                });
                context.read<PersonalInfoBloc>().add(UpdateGender(gender: 'Male'));
              },
              icon: const Icon(Icons.male),
              iconSize: height * 0.2,
              color: maleButtonColor,
            ),
            const Text('male'),
            IconButton(
              onPressed: () {
                setState(() {
                  femaleButtonColor = Colors.purple;
                  maleButtonColor = Colors.grey;
                });
                context.read<PersonalInfoBloc>().add(UpdateGender(gender: 'Female'));
              },
              icon: const Icon(Icons.female),
              iconSize: height * 0.2,
              color: femaleButtonColor,
            ),
            const Text('female'),
            SizedBox(
              height: height * 0.12,
            ),
            BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
              builder: (context, state) {
                return CommonButton(height: height * 0.07, title: 'Next', onTap: (){
                  if(state.gender == ''){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select your gender')));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectAgePage(name: widget.name, email: widget.email)));
                  }
                },);
              },
            ),
          ],
        ),
      ),
    );
  }
}
