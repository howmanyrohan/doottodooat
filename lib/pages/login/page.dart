import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:doottodooat/pages/login/data.dart';
import 'package:doottodooat/pages/login/interface.dart';
import 'package:doottodooat/pages/login/notifier.dart';
import 'package:doottodooat/pages/login/widgets/login_form/widget.dart';

class Page extends StatelessWidget {
  Page({super.key, Interface? data})
      : notifier = Notifier(data ?? Data(Supabase.instance.client.auth));

  final Notifier notifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LoginForm(
              onSignIn: notifier.signIn,
              onSignUp: notifier.signUp,
            ),
          ),
        ),
      ),
    );
  }
}
