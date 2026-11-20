class Todo {
  const Todo({
    required this.id,
    required this.title,
    required this.done,
    required this.position,
  });

  final int id;
  final String title;
  final bool done;
  final double position;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'] as int,
        title: json['title'] as String,
        done: json['done'] as bool,
        position: (json['position'] as num).toDouble(),
      );
}
