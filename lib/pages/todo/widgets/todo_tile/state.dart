part of 'widget.dart';

class _TodoTileState extends State<TodoTile> {
  final _controller = TextEditingController();
  var _editing = false;

  void _edit() {
    _controller.text = widget.todo.title;
    setState(() => _editing = true);
  }

  void _save() {
    if (!_editing) return;
    setState(() => _editing = false);
    widget.onRename(widget.todo, _controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todo = widget.todo;
    return ListTile(
      onTap: _editing ? null : _edit,
      leading: IconButton(
        icon: Icon(
          todo.done ? Icons.check_circle : Icons.radio_button_unchecked,
        ),
        tooltip: todo.done ? 'Mark not done' : 'Mark done',
        onPressed: () => widget.onToggle(todo),
      ),
      title: _editing
          ? TextField(
              controller: _controller,
              autofocus: true,
              onSubmitted: (_) => _save(),
              onTapOutside: (_) => _save(),
            )
          : Text(
              todo.title,
              style: todo.done
                  ? const TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
            ),
    );
  }
}
