part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool formValid;
  final bool emailValid;
  final bool passwordValid;

  LoginState({
    required this.email,
    required this.password,
    required this.formValid,
    required this.emailValid,
    required this.passwordValid,
  });

  static LoginState get initialState => LoginState(
        email: '',
        password: '',
        formValid: false,
        emailValid: false,
        passwordValid: false,
      );

  LoginState copyWith({
    String? email,
    String? password,
    bool? formValid,
    bool? emailValid,
    bool? passwordValid,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formValid: formValid ?? this.formValid,
      emailValid: emailValid ?? this.emailValid,
      passwordValid: passwordValid ?? this.passwordValid,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        formValid,
        emailValid,
        passwordValid,
      ];
}
