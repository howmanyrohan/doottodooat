part of 'widget.dart';

class _TodoListState extends State<TodoList> {
  late var _open = _openOf(widget.todos);

  List<Todo> _openOf(List<Todo> todos) => [
        for (final todo in todos)
          if (!todo.done) todo,
      ];

  @override
  void didUpdateWidget(TodoList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _open = _openOf(widget.todos);
  }

  void _move(int from, int to) {
    widget.onMove(_open, from, to);
    setState(() => _open = [..._open]..insert(to, _open.removeAt(from)));
  }

  Widget _tile(Todo todo) => Dismissible(
        key: ValueKey(todo.id),
        resizeDuration: null,
        onDismissed: (_) => widget.onDelete(todo),
        background: Container(color: Theme.of(context).colorScheme.error),
        child: TodoTile(
          todo: todo,
          onToggle: widget.onToggle,
          onRename: widget.onRename,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final done = [
      for (final todo in widget.todos)
        if (todo.done) todo,
    ];
    return ReorderableListView(
      onReorderItem: _move,
      footer: done.isEmpty
          ? null
          : ExpansionTile(
              title: Text('Completed (${done.length})'),
              children: [for (final todo in done) _tile(todo)],
            ),
      children: [for (final todo in _open) _tile(todo)],
    );
  }
}
