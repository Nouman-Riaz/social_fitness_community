import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/main.dart';
import 'package:softech/modules/common/common_button.dart';
import 'package:softech/modules/enthusiast_view/bloc/enthusiast_bloc.dart';
import 'package:softech/modules/enthusiast_view/bloc/enthusiast_event.dart';
import 'package:softech/modules/enthusiast_view/bloc/enthusiast_state.dart';

class EnthusiastView extends StatelessWidget {
  EnthusiastView({Key? key}) : super(key: key);

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
                            List<bool> indexes = List.from(state.activitiesSelectedIndex);
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
                BlocBuilder<EnthusiastBloc, EnthusiastState>(builder: (context, state){
                  return CommonButton(height: height * 0.07, title: 'Next', onTap: (){
                    List<bool> indexes = List.from(state.activitiesSelectedIndex);
                    final isAllFalse = indexes.every((bool index) => index == false);
                    if(state.goalsSelectedIndex == -1 || isAllFalse){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a fitness goal and activity')));
                      return;
                    }
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
