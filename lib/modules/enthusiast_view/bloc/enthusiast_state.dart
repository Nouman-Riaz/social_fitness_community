import 'package:equatable/equatable.dart';
import 'package:softech/modules/login/bloc/login_state.dart';

class EnthusiastState extends Equatable{

  const EnthusiastState({
    this.goalsSelectedIndex = -1,
    this.activitiesSelectedIndex = const [false,false,false,false,false],
    this.apiState = APIState.idle,
});

  @override
  List<Object?> get props => [goalsSelectedIndex, activitiesSelectedIndex, apiState];

  final int goalsSelectedIndex;
  final List<bool> activitiesSelectedIndex;
  final APIState apiState;

  EnthusiastState copyWith({int? goalsSelectedIndex, List<bool>? activitiesSelectedIndex, APIState? apiState}) {
    return EnthusiastState(
      goalsSelectedIndex: goalsSelectedIndex ?? this.goalsSelectedIndex,
      activitiesSelectedIndex: activitiesSelectedIndex ?? this.activitiesSelectedIndex,
      apiState: apiState ?? this.apiState,
    );
  }

}