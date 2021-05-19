part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SignInButton extends LoginEvent {
  String email, password;

  SignInButton({@required this.email, @required this.password});
}
