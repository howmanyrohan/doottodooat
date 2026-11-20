import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:doottodooat/models/todo.dart';
import 'package:doottodooat/pages/todo/interface.dart';

class Data implements Interface {
  Data(this.client);
  final SupabaseClient client;

  @override
  Stream<List<Todo>> watchTodos() => client
      .from('todos')
      .stream(primaryKey: ['id'])
      .order('position')
      .map((rows) => rows.map(Todo.fromJson).toList());

  @override
  Future<void> addTodo(String title) async {
    await client.from('todos').insert({'title': title});
  }

  @override
  Future<void> setDone(int id, bool done) async {
    await client.from('todos').update({'done': done}).eq('id', id);
  }

  @override
  Future<void> renameTodo(int id, String title) async {
    await client.from('todos').update({'title': title}).eq('id', id);
  }

  @override
  Future<void> moveTodo(int id, double position) async {
    await client.from('todos').update({'position': position}).eq('id', id);
  }

  @override
  Future<void> deleteTodo(int id) async {
    await client.from('todos').delete().eq('id', id);
  }

  @override
  Future<void> signOut() => client.auth.signOut();
}
