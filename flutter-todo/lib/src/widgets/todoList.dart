import 'package:flutter/material.dart';
import 'package:todoapp/src/models/todo.dart';
import 'package:todoapp/src/services/todoService.dart';
import 'package:todoapp/src/widgets/todoItem.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Future<List> futureTodo;

  @override
  void initState() {
    super.initState();
    futureTodo = fetchTodos();
  }

  Widget buildList(List<Todo> data) {
    List<TodoItem> todoItems =
        data.map((todo) => TodoItem(todo: todo)).toList();
    return Column(
      children: todoItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List>(
          future: futureTodo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        )
      ],
    );
  }
}
