import 'dart:developer';

import 'package:example_flutterbloc/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBLoC(),
      child: Scaffold(
        appBar: AppBar(title: Text('Login Example Bloc')),
        body: LoginLayout(),
      ),
    );
  }
}

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBLoC>();
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      children: [
        BlocSelector<LoginBLoC, LoginState, bool>(
          selector: (state) => state.emailValid,
          builder: (context, value) {
            log('rebuild email');
            return CustonImput(
              placeholder: 'Email',
              onChanged: (value) => bloc.add(ChangeEmail(value)),
              borderColor: value ? Colors.black45 : Colors.red,
            );
          },
        ),
        SizedBox(height: 15),
        BlocBuilder<LoginBLoC, LoginState>(
          buildWhen: (previous, current) =>
              previous.passwordValid != current.passwordValid ||
              previous.emailValid != current.emailValid,
          builder: (_, state) {
            log('rebuild password');
            return CustonImput(
              placeholder: 'Password',
              onChanged: (value) => bloc.add(ChangePassword(value)),
              borderColor: state.passwordValid ? Colors.black45 : Colors.red,
            );
          },
        ),
        // BlocBuilder<LoginBLoC, LoginState>(
        //   buildWhen: (previous, current) =>
        //       previous.passwordValid != current.passwordValid,
        //   builder: (_, state) {
        //     log('rebuild password');
        //     return CustonImput(
        //       placeholder: 'Password',
        //       onChanged: (value) => bloc.add(ChangePassword(value)),
        //       borderColor: state.passwordValid ? Colors.black45 : Colors.red,
        //     );
        //   },
        // ),
        // BlocSelector<LoginBLoC, LoginState, bool>(
        //   selector: (state) => state.passwordValid,
        //   builder: (context, value) {
        // log('rebuild password');
        // return CustonImput(
        //   placeholder: 'Password',
        //   onChanged: (value) => bloc.add(ChangePassword(value)),
        //   borderColor: value ? Colors.black45 : Colors.red,
        // );
        //   },
        // ),
        SizedBox(height: 30),
        BlocSelector<LoginBLoC, LoginState, bool>(
          selector: (state) => state.formValid,
          builder: (context, value) {
            log('rebuild button');
            return CupertinoButton(
              color: Colors.blue,
              disabledColor: Colors.blueGrey,
              onPressed: value ? () => bloc.add(SubmitEvent()) : null,
              child: Text('Login'),
            );
          },
        ),
      ],
    );
  }
}

class CustonImput extends StatelessWidget {
  const CustonImput({
    Key? key,
    required this.placeholder,
    required this.onChanged,
    required this.borderColor,
  }) : super(key: key);
  final String placeholder;
  final ValueChanged<String> onChanged;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      onChanged: onChanged,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
