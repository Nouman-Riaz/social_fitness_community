import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/modules/fitness_professional/fitness_professional_view.dart';
import 'package:softech/modules/personal_information/view/personal_name_view.dart';

import '../../../main.dart';
import '../../common/common_button.dart';
import '../bloc/personal_info_bloc.dart';
import '../bloc/personal_info_events.dart';
import '../bloc/personal_info_state.dart';

class PersonalTypeView extends StatelessWidget {
  PersonalTypeView({Key? key, required this.email}) : super(key: key);

  final types = ['Fitness Enthusiast', 'Fitness Professional'];
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.09,
              ),
              const Text(
                'Whats Your Type?',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              const Text(
                'How are you recognised in your community',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
              SizedBox(
                height: height * 0.19,
              ),
              BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
                builder: (context, state) {
                  return DropdownButton(
                    hint: Text(state.type),
                    items: types
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      context
                          .read<PersonalInfoBloc>()
                          .add(UpdateType(type: value!));
                    },
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
                  builder: (context, state) {
                    return CommonButton(
                        height: height * 0.07,
                        title: 'Next',
                        onTap: () {
                          if (state.type == 'Select') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please select your type')));
                          } else {
                            if (state.type == 'Fitness Enthusiast') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PersonalInformationView(type: 'Fitness Enthusiast', email: email)));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfessionalView()));
                            }
                          }
                        });
                  },
                ),
              ),
              SizedBox(
                height: height * 0.08,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
