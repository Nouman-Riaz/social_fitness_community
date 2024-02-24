abstract class LoginEvent{}

class ShowPasswordEvent extends LoginEvent{}

class Login extends LoginEvent{
  final String email;
  final String password;

  Login({required this.email, required this.password});
}