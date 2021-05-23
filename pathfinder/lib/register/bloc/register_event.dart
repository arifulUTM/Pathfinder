part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SignUpButton extends RegisterEvent {
  String email, password;
  SignUpButton({@required this.email, @required this.password});
}
