import 'package:equatable/equatable.dart';

enum APIState { idle, error, loading, done }

class LoginBlocState extends Equatable {
  @override
  List<Object?> get props => [authApiState, errorMessage, showPassword];

  final String errorMessage;
  final APIState authApiState;
  final bool showPassword;

  const LoginBlocState({
    this.errorMessage = '',
    this.showPassword = false,
    this.authApiState = APIState.idle,
  });

  LoginBlocState copyWith({
    String? errorMessage,
    APIState? authApiState,
    bool? showPassword,
  }) {
    return LoginBlocState(
        errorMessage: errorMessage ?? this.errorMessage,
        authApiState: authApiState ?? this.authApiState,
        showPassword: showPassword ?? this.showPassword
    );
  }
}