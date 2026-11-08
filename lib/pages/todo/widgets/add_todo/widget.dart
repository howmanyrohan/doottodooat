import 'package:flutter/material.dart';

part 'state.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key, required this.onSubmit});

  final ValueChanged<String> onSubmit;

  @override
  State<AddTodo> createState() => _AddTodoState();
}
