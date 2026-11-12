import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:doottodooat/pages/login/interface.dart';
import 'package:doottodooat/pages/login/util.dart';

class Data implements Interface {
  Data(this.auth);
  final GoTrueClient auth;

  @override
  Future<String?> signIn(String email, String password) => authError(
        () => auth.signInWithPassword(email: email, password: password),
      );

  @override
  Future<String?> signUp(String email, String password) =>
      authError(() => auth.signUp(email: email, password: password));
}
