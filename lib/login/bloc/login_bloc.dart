import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBLoC extends Bloc<LoginEvent, LoginState> {
  LoginBLoC() : super(LoginState.initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is ChangeEmail) {
      yield* _changeEmail(event);
    } else if (event is ChangePassword) {
      yield* _changePassword(event);
    } else if (event is SubmitEvent) {
      log('Email: ${state.email}');
      log('Password: ${state.password}');
    }
  }

  Stream<LoginState> _changeEmail(ChangeEmail event) async* {
    final emailValid = event.email.contains('@');
    final formValid = state.passwordValid && emailValid;
    yield state.copyWith(
      email: event.email,
      emailValid: emailValid,
      formValid: formValid,
    );
  }

  Stream<LoginState> _changePassword(ChangePassword event) async* {
    final passwordValid = event.password.length > 5;
    final formValid = state.emailValid && passwordValid;
    yield state.copyWith(
      password: event.password,
      passwordValid: passwordValid,
      formValid: formValid,
    );
  }
}
