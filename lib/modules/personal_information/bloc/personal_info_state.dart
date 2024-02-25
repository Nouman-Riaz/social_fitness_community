import 'package:equatable/equatable.dart';

class PersonalInfoState extends Equatable {

  const PersonalInfoState({
    this.name = '',
    this.type = 'Select',
    this.gender = '',
    this.age = 15,
    this.height = 100,
    this.weight = 65,
    this.goal = '',
    this.activities = const [],
});

  @override
  List<Object?> get props => [name, type, age, gender, height, weight, goal, activities];

  final String name;
  final String type;
  final String gender;
  final int age;
  final int height;
  final int weight;
  final String goal;
  final List<String> activities;

  PersonalInfoState copyWith({
    String? name,
    String? type,
    String? gender,
    String? goal,
    int? age,
    int? height,
    int? weight,
    List<String>? activities
  }) {
    return PersonalInfoState(
      name: name ?? this.name,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      goal: goal ?? this.goal,
      activities: activities ?? this.activities,
    );
  }

}