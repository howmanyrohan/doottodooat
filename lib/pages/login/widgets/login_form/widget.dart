import 'package:flutter/material.dart';

part 'state.dart';

typedef AuthAction = Future<String?> Function(String email, String password);

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.onSignIn, required this.onSignUp});

  final AuthAction onSignIn;
  final AuthAction onSignUp;

  @override
  State<LoginForm> createState() => _LoginFormState();
}
