import 'package:bloc/bloc.dart';
import 'package:softech/modules/enthusiast_view/bloc/enthusiast_event.dart';
import 'package:softech/modules/enthusiast_view/bloc/enthusiast_state.dart';

class EnthusiastBloc extends Bloc<EnthusiastEvent, EnthusiastState>{
  EnthusiastBloc() : super(const EnthusiastState()){
    on<UpdateIndexEvent>((event, emit){
      emit(state.copyWith(goalsSelectedIndex: event.index));
    });
    on<UpdateActivitiesEvent>((event, emit){
      emit(state.copyWith(activitiesSelectedIndex: event.index));
    });
  }
}