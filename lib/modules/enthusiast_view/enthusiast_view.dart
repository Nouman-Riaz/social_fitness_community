import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/main.dart';
import 'package:softech/models/enthusiast_model.dart';
import 'package:softech/modules/common/common_button.dart';
import 'package:softech/modules/enthusiast_view/bloc/enthusiast_bloc.dart';
import 'package:softech/modules/enthusiast_view/bloc/enthusiast_event.dart';
import 'package:softech/modules/enthusiast_view/bloc/enthusiast_state.dart';
import 'package:softech/modules/login/login_view.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_bloc.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_state.dart';

import '../personal_information/bloc/personal_info_events.dart';

class EnthusiastView extends StatelessWidget {
  EnthusiastView({Key? key, required this.name}) : super(key: key);

  final String name;

  final List<String> goals = [
    'Lose Weight',
    'Building Muscle',
    'Gain Weight',
    'Stay Fit',
    'Stay Healthy'
  ];

  final List<String> fitnessActivities = [
    'Running',
    'Weightlifting',
    'Yoga',
    'Cycling',
    'Swimming',
  ];

  List<bool> indexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                const Text(
                  'Welcome, Enthusiast',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                ),
                const Text(
                  'Tell us more about yourself',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                const Text(
                  'Fitness Goal',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                for (int i = 0; i < 5; i++) ...[
                  BlocBuilder<EnthusiastBloc, EnthusiastState>(
                      builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context.read<EnthusiastBloc>().add(UpdateIndexEvent(i));
                        context.read<PersonalInfoBloc>().add(UpdateGoal(goal: goals[i]));
                      },
                      child: FitnessGoalTile(
                          isSelected: state.goalsSelectedIndex == i,
                          title: goals[i]),
                    );
                  })
                ],
                SizedBox(
                  height: height * 0.04,
                ),
                const Text(
                  'Preferred Activities',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                for (int i = 0; i < 5; i++) ...[
                  BlocBuilder<EnthusiastBloc, EnthusiastState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            indexes = List.from(state.activitiesSelectedIndex);
                            indexes[i] = !indexes[i];
                            context.read<EnthusiastBloc>().add(UpdateActivitiesEvent(indexes));
                          },
                          child: FitnessGoalTile(
                              isSelected: state.activitiesSelectedIndex[i],
                              title: fitnessActivities[i]),
                        );
                      })
                ],
                SizedBox(
                  height: height * 0.04,
                ),
                BlocBuilder<PersonalInfoBloc, PersonalInfoState>(builder: (context, state){
                  return CommonButton(height: height * 0.07, title: 'Next', onTap: (){
                    List<String> selectedGoals = [];
                    for (int i = 0; i < indexes.length; i++) {
                      if (indexes[i]) {
                        selectedGoals.add(fitnessActivities[i]);
                      }
                    }

                      final enthusiast = EnthusiastModel(name: name, type: state.type, age: state.age, height: state.height, weight: state.weight, location: '', following: [], fitnessGoal: state.goal, preferredActivities: selectedGoals);
                      context.read<EnthusiastBloc>().add(StoreDataEvent(model: enthusiast));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
                  });
                }),
                SizedBox(
                  height: height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FitnessGoalTile extends StatelessWidget {
  const FitnessGoalTile(
      {Key? key, required this.isSelected, required this.title})
      : super(key: key);

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      child: Container(
        width: width,
        height: height * 0.075,
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border:
              Border.all(color: isSelected ? Colors.black : Colors.grey[300]!),
        ),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
