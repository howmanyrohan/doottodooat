import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:doottodooat/pages/todo/page.dart' as todo;

void main() => runApp(const App());

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => todo.Page()),
  ],
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
