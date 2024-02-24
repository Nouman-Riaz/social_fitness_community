import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softech/modules/common/common_button.dart';
import 'package:softech/modules/fitness_professional/bloc/professional_bloc.dart';
import 'package:softech/modules/fitness_professional/bloc/professional_state.dart';
import 'package:softech/modules/fitness_professional/bloc/professtional_event.dart';

import '../../main.dart';

class ProfessionalView extends StatefulWidget {
  const ProfessionalView({super.key});

  @override
  State<ProfessionalView> createState() =>
      _SelectCertificationsPagStateState();
}

class _SelectCertificationsPagStateState
    extends State<ProfessionalView> {
  final List<String> certificationsList = [
    'personal trainer',
    'group fitness',
    'clinical',
    'human performance',
    'none'
  ];
  int _selectedIndex = 0;
  final TextEditingController certificatesController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height * 0.03,
                ),
                const Text(
                  'Welcome, Fitness Professional',
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
                  'Speciality',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  direction: Axis.vertical,
                  children: List<Widget>.generate(certificationsList.length, (index) {
                    return ChoiceChip(
                      label: Text(certificationsList[index]),
                      selected: _selectedIndex == index,
                      onSelected: (bool selected) {
                        _onItemTapped(index);
                        context.read<ProfessionalBloc>().add(
                          UpdateSpeciality(certificationsList[index]),
                        );
                      },
                    );
                  }),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                const Text(
                  'Certification',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                BlocBuilder<ProfessionalBloc, ProfessionalState>(builder: (context, state){
                  return TextFormField(
                    controller: certificatesController,
                    decoration: InputDecoration(
                      labelText: 'Certificates',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(35)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                    onFieldSubmitted: (val){
                      List<String> certificates = List.from(state.certificates);
                      certificates.add(val);
                      context.read<ProfessionalBloc>().add(UpdateCertificates(certificates));
                    },
                  );
                }),
                SizedBox(
                  height: height * 0.04,
                ),
                BlocBuilder<ProfessionalBloc, ProfessionalState>(builder: (context, state) {
                  return Container(
                    height: height * 0.2,
                    child: ListView.builder(
                    itemCount: state.certificates.length,
                        itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        child: CertificateRow(
                          text: state.certificates[index],
                          onTap: () {
                            List<String> certificates = List.from(state.certificates);
                            certificates.removeAt(index);
                            context.read<ProfessionalBloc>().add(UpdateCertificates(certificates));
                          },
                        ),
                      );
                    }),
                  );
                }),
                SizedBox(height: height * 0.08),
                CommonButton(height: height * 0.07, title: 'Next', onTap: () {} ),
                SizedBox(height: height * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CertificateRow extends StatelessWidget {
  const CertificateRow({Key? key, required this.text, required this.onTap}) : super(key: key);

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          InkWell(
              onTap: (){
                onTap.call();
              },
              child: Icon(Icons.cancel, size: width * 0.08,)),
          SizedBox(width: width * 0.04),
          Text(text, style: const TextStyle(fontSize: 18),)
        ],
      );
  }
}

