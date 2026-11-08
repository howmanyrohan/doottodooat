part of 'widget.dart';

class _AddTodoState extends State<AddTodo> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(hintText: 'Add a todo...'),
      onSubmitted: (title) {
        widget.onSubmit(title);
        _controller.clear();
      },
    );
  }
}
