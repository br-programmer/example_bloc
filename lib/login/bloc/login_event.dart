part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitEvent extends LoginEvent {}

class ChangeEmail extends LoginEvent {
  ChangeEmail(this.email);
  final String email;

  @override
  List<Object?> get props => [email];
}

class ChangePassword extends LoginEvent {
  ChangePassword(this.password);
  final String password;

  @override
  List<Object?> get props => [password];
}
