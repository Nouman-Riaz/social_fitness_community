import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:softech/models/enthusiast_model.dart';
import 'package:softech/modules/enthusiast_view/bloc/enthusiast_event.dart';
import 'package:softech/modules/enthusiast_view/bloc/enthusiast_state.dart';

import '../../login/bloc/login_state.dart';

class EnthusiastBloc extends Bloc<EnthusiastEvent, EnthusiastState>{
  EnthusiastBloc() : super(const EnthusiastState()){
    on<UpdateIndexEvent>((event, emit){
      emit(state.copyWith(goalsSelectedIndex: event.index));
    });
    on<UpdateActivitiesEvent>((event, emit){
      emit(state.copyWith(activitiesSelectedIndex: event.index));
    });
    on<StoreDataEvent>((event, emit)async{
      await storeData(event.model, emit);
    });
  }

  Future storeData(EnthusiastModel model, Emitter emit) async {
    emit(state.copyWith(apiState: APIState.loading));
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    debugPrint("Name ----->>>> ${model.name}");
    await firestore.collection('enthusiasts').doc(model.name).set(model.toJson());
    emit(state.copyWith(apiState: APIState.done));
  }
}