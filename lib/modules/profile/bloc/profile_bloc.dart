import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:softech/modules/profile/bloc/profile_event.dart';
import 'package:softech/modules/profile/bloc/profile_state.dart';

import '../../../models/enthusiast_model.dart';
import '../../login/bloc/login_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  ProfileBloc() : super(const ProfileState()){
    on<GetProfileEvent>((event, emit) async {
      await getUserByEmail(event.email, emit);
    });
  }

  Future<void> getUserByEmail(String email, Emitter emit) async {
    try {
      emit(state.copyWith(apiState: APIState.loading));
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentSnapshot snapshot = await firestore.collection('enthusiasts').doc(email).get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        final model = EnthusiastModel(
          name: data['name'],
          type: data['type'],
          age: data['age'],
          email: data['email'],
          height: data['height'],
          weight: data['weight'],
          location: data['location'],
          following: List<String>.from(data['following']),
          fitnessGoal: data['fitnessGoal'],
          preferredActivities: List<String>.from(data['preferredActivities']),
        );
        emit(state.copyWith(apiState: APIState.done, model: model));
      } else {
        return; // User not found
      }
    } catch (e) {
      emit(state.copyWith(apiState: APIState.done));
      return;
    }
  }


}