import 'package:equatable/equatable.dart';

class PersonalInfoState extends Equatable {

  const PersonalInfoState({
    this.name = '',
    this.type = 'Select',
});

  @override
  List<Object?> get props => [name, type];

  final String name;
  final String type;

  PersonalInfoState copyWith({
    String? name,
    String? type,
  }) {
    return PersonalInfoState(
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

}