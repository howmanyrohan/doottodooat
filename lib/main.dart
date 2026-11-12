import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:doottodooat/pages/login/page.dart' as login;
import 'package:doottodooat/pages/todo/page.dart' as todo;

Future<void> main() async {
  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    publishableKey: const String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY'),
  );
  runApp(const App());
}

final _auth = Supabase.instance.client.auth;

final _router = GoRouter(
  refreshListenable: _AuthChanges(),
  redirect: (context, state) {
    final signedIn = _auth.currentSession != null;
    final atLogin = state.matchedLocation == '/login';
    if (!signedIn && !atLogin) return '/login';
    if (signedIn && atLogin) return '/';
    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => todo.Page()),
    GoRoute(path: '/login', builder: (context, state) => login.Page()),
  ],
);

class _AuthChanges extends ChangeNotifier {
  _AuthChanges() {
    _auth.onAuthStateChange.listen((_) => notifyListeners());
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
