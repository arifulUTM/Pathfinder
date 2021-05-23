import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pathfinder/user_profile/Users.dart';
import 'package:flutter/cupertino.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  Users users;
  RegisterBloc({this.users}) : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is SignUpButton) {
      yield RegisterLoading();
      try {
        var user = await users.signUp(event.email, event.password);
        yield RegisterSucced(user: user);
      } catch (e) {
        yield RegisterFailed(message: e.toString());
      }
    }
  }
}
