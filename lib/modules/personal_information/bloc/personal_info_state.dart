import 'package:equatable/equatable.dart';

class PersonalInfoState extends Equatable {

  const PersonalInfoState({
    this.name = '',
    this.type = 'Select',
    this.gender = '',
    this.age = 15,
    this.height = 100,
    this.weight = 65,
});

  @override
  List<Object?> get props => [name, type, age, gender, height, weight];

  final String name;
  final String type;
  final String gender;
  final int age;
  final int height;
  final int weight;

  PersonalInfoState copyWith({
    String? name,
    String? type,
    String? gender,
    int? age,
    int? height,
    int? weight,
  }) {
    return PersonalInfoState(
      name: name ?? this.name,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }

}