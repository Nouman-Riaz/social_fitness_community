import 'package:equatable/equatable.dart';

class EnthusiastState extends Equatable{

  const EnthusiastState({
    this.goalsSelectedIndex = -1,
    this.activitiesSelectedIndex = const [false,false,false,false,false],
});

  @override
  List<Object?> get props => [goalsSelectedIndex, activitiesSelectedIndex];

  final int goalsSelectedIndex;
  final List<bool> activitiesSelectedIndex;

  EnthusiastState copyWith({int? goalsSelectedIndex, List<bool>? activitiesSelectedIndex}){
    return EnthusiastState(
      goalsSelectedIndex: goalsSelectedIndex ?? this.goalsSelectedIndex,
      activitiesSelectedIndex: activitiesSelectedIndex ?? this.activitiesSelectedIndex,
    );
  }

}