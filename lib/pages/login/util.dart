import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> authError(Future<void> Function() action) async {
  try {
    await action();
    return null;
  } on AuthException catch (e) {
    return e.message;
  }
}
