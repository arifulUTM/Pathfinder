part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SingnUpButton extends RegisterEvent {
  String email, password;
  SingnUpButton({@required this.email, @required this.password});
}
