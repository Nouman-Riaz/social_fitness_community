import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/utils.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginBlocState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  LoginBloc() : super(const LoginBlocState()){
    on<ShowPasswordEvent>((event, emit) {
      showPassword(emit);
    });
    on<Login>((event, emit) async {
      await login(event.email, event.password, emit);
    });
  }

  // Future logout() async {
  //   await authService.signOut();
  // }

  Future login(String email, String password, Emitter emit) async {
    emit(state.copyWith(authApiState: APIState.loading));
    await _auth
        .signInWithEmailAndPassword(
        email: email,
        password: password)
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      emit(state.copyWith(authApiState: APIState.done));
    }).onError((error, stackTrace) {
      emit(state.copyWith(authApiState: APIState.error));
      Utils().toastMessage(error.toString());
    });
  }

  void updateError(String exception, Emitter emit) {
    switch (exception) {
      case 'Something went wrong':
        String error = 'Something went wrong';
        emit(state.copyWith(
          errorMessage: error,
          authApiState: APIState.error,
        ));
        break;
      case '[firebase_auth/unknown] Given String is empty or null':
        String error = 'Enter correct credentials';
        emit(state.copyWith(
          errorMessage: error,
          authApiState: APIState.error,
        ));
        break;
      case 'Enter correct credentials':
        String error = 'Enter correct credentials';
        emit(state.copyWith(
          errorMessage: error,
          authApiState: APIState.error,
        ));
        break;
      case 'invalid-email':
        String error = 'Invalid email format';
        emit(state.copyWith(
          errorMessage: error,
          authApiState: APIState.error,
        ));
        break;
      case 'wrong-password':
        String error = 'Invalid Password';
        emit(state.copyWith(
          errorMessage: error,
          authApiState: APIState.error,
        ));
        break;
      case 'user-not-found':
        String error = 'User not found';
        emit(state.copyWith(
          errorMessage: error,
          authApiState: APIState.error,
        ));
        break;
      case 'user-disabled':
        String error = 'User account disabled';
        emit(state.copyWith(
          errorMessage: error,
          authApiState: APIState.error,
        ));
        break;
      case 'email-already-in-use':
        String error = 'Email is already in use';
        emit(state.copyWith(
          errorMessage: error,
          authApiState: APIState.error,
        ));
        break;
      case 'weak-password':
        String error = 'Weak Password';
        emit(state.copyWith(
          errorMessage: error,
          authApiState: APIState.error,
        ));
        break;
    }
  }

  void showPassword(Emitter emit){
    emit(state.copyWith(showPassword: !state.showPassword));
  }
}