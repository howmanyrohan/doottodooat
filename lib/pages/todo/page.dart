import 'package:flutter/material.dart';

import 'package:doottodooat/database/database.dart';
import 'package:doottodooat/pages/todo/data.dart';
import 'package:doottodooat/pages/todo/interface.dart';
import 'package:doottodooat/pages/todo/notifier.dart';
import 'package:doottodooat/pages/todo/widgets/add_todo/widget.dart';
import 'package:doottodooat/pages/todo/widgets/todo_list/widget.dart';

class Page extends StatelessWidget {
  Page({super.key, Interface? data}) : notifier = Notifier(data ?? Data(db));

  final Notifier notifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AddTodo(onSubmit: notifier.addTodo),
            Expanded(
              child: StreamBuilder(
                stream: notifier.todos,
                builder: (context, snapshot) =>
                    TodoList(todos: snapshot.data ?? []),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
