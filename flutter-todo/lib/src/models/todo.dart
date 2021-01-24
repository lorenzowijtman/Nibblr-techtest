class Todo {
  String title;
  String description;
  bool complete;
  final int id;

  Todo({this.title, this.description, this.id, this.complete});

  // encoder will call this function to transform todo-item to JSON
  Map<String, dynamic> toJson() =>
      {
        'userId': 1,
        'title': title,
        'completed': complete,
        'description': description
      };

  //Factory method for transforming json mapping into todo-item
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      description: 'Some description',
      id: json['id'],
      complete: json['completed'],
    );
  }
}
