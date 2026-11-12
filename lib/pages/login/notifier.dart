import 'package:flutter/foundation.dart';

import 'package:doottodooat/pages/login/interface.dart';

class Notifier extends ChangeNotifier {
  Notifier(this.data);
  final Interface data;

  Future<String?> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) return 'Enter email and password';
    return data.signIn(email, password);
  }

  Future<String?> signUp(String email, String password) async {
    if (email.isEmpty || password.isEmpty) return 'Enter email and password';
    return data.signUp(email, password);
  }
}
