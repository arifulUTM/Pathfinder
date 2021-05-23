import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pathfinder/user_profile/Users.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  Users users;
  LoginBloc({this.users}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SignInButton) {
      yield LoginLoading();

      try {
        var user = await users.signIn(event.email, event.password);
        yield LoginSucced(user: user);
      } catch (e) {
        yield LoginFailed(message: e.toString());
      }
    }
  }
}
