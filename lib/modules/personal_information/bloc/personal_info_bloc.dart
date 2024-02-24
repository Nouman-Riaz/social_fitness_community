import 'package:bloc/bloc.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_events.dart';
import 'package:softech/modules/personal_information/bloc/personal_info_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState>{
  PersonalInfoBloc() : super(const PersonalInfoState()){
    on<UpdateName>((event, emit){
      updateName(event.name, emit);
    });
    on<UpdateType>((event, emit){
      updateType(event.type, emit);
    });
  }

  void updateName(String name, Emitter<PersonalInfoState> emit){
    emit(state.copyWith(name: name));
  }

  void updateType(String type, Emitter<PersonalInfoState> emit){
    emit(state.copyWith(type: type));
  }

}