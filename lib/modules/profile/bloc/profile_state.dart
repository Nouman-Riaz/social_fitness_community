import 'package:equatable/equatable.dart';
import 'package:softech/models/enthusiast_model.dart';

import '../../login/bloc/login_state.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.apiState = APIState.idle,
    this.model,
  });

  @override
  List<Object> get props => [apiState, model ?? Object()];

  final APIState apiState;
  final EnthusiastModel? model;

  ProfileState copyWith({
    APIState? apiState,
    EnthusiastModel? model,
  }) {
    return ProfileState(
      apiState: apiState ?? this.apiState,
      model: model ?? this.model,
    );
  }
}