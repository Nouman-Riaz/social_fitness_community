import 'package:bloc/bloc.dart';
import 'package:softech/modules/signup/bloc/signup_event.dart';
import 'package:softech/modules/signup/bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignUpBlocState>{
  SignUpBloc() : super(const SignUpBlocState()){
    on<ShowPasswordEvent>((event, emit){
      showPassword(emit);
    });
    on<ShowConfirmPasswordEvent>((event, emit) {
      showConfirmPassword(emit);
    });
  }


  // Future register(String email, String name, String password, String confirmPassword) async {
  //   emit(state.copyWith(registerApiState: Event.loading));
  //   try {
  //     await authService.registerUser(email, name, password, confirmPassword);
  //     emit(state.copyWith(registerApiState: Event.done));
  //   } on FirebaseException catch(e){
  //     debugPrint('----->>> ${e.toString()}');
  //     updateError(e.code);
  //   }
  //   catch(e){
  //     debugPrint('----->>> ${e.toString()}');
  //     updateError(e.toString());
  //   }
  // }

  void showPassword(Emitter emit){
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void showConfirmPassword(Emitter emit){
    emit(state.copyWith(showConfirmPassword: !state.showConfirmPassword));
  }

  void updateError(String exception, Emitter emit){
    switch(exception){
      case 'Something went wrong':
        String error = 'Something went wrong';
        emit(state.copyWith(errorMessage: error, registerApiState: Event.error));
        break;
      case 'Enter correct credentials':
        String error = 'Enter correct credentials';
        emit(state.copyWith(errorMessage: error, registerApiState: Event.error));
        break;
      case '[firebase_auth/invalid-email] The email address is badly formatted':
        String error = 'Invalid email format';
        emit(state.copyWith(errorMessage: error, registerApiState: Event.error));
        break;
      case 'invalid-email':
        String error = 'Invalid email format';
        emit(state.copyWith(errorMessage: error, registerApiState: Event.error));
        break;
      case 'wrong-password':
        String error = 'Invalid Password';
        emit(state.copyWith(errorMessage: error, registerApiState: Event.error));
        break;
      case 'user-not-found':
        String error = 'User not found';
        emit(state.copyWith(errorMessage: error, registerApiState: Event.error));
        break;
      case 'user-disabled':
        String error = 'User account disabled';
        emit(state.copyWith(errorMessage: error, registerApiState: Event.error));
        break;
      case 'email-already-in-use':
        String error = 'Email is already in use';
        emit(state.copyWith(errorMessage: error, registerApiState: Event.error));
        break;
      case 'weak-password':
        String error = 'Weak Password';
        emit(state.copyWith(errorMessage: error, registerApiState: Event.error));
        break;
    }
  }


}