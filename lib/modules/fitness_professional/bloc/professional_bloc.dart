import 'package:bloc/bloc.dart';
import 'package:softech/modules/fitness_professional/bloc/professional_state.dart';
import 'package:softech/modules/fitness_professional/bloc/professtional_event.dart';

class ProfessionalBloc extends Bloc<ProfessionalEvent, ProfessionalState> {
  ProfessionalBloc() : super(const ProfessionalState()){
    on<UpdateCertificates>((event, emit){
      emit(state.copyWith(certificates: event.certificates));
    });
    on<UpdateSpeciality>((event, emit){
      emit(state.copyWith(speciality: event.speciality));
    });
  }
}