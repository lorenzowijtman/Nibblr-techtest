import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoapp/src/models/todo.dart';

final Map headers = <String, String>{
  'Content-Type': 'application/json; charset=UTF-8'
};

Future<List> fetchTodos() async {
  final res =
      await http.get('https://jsonplaceholder.typicode.com/users/1/todos');

  if (res.statusCode == 200) {
    Iterable l = json.decode(res.body);
    List<Todo> todoList = List<Todo>.from(l.map((e) => Todo.fromJson(e)));
    return todoList;
  } else {
    throw Exception('Failed to load todos, error code ${res.statusCode}');
  }
}

Future<bool> createTodo(Todo todo) async {
  final res = await http.post(
    'https://jsonplaceholder.typicode.com/todos',
    headers: headers,
    body: jsonEncode(todo),
  );

  if (res.statusCode == 201) {
    return true;
  } else {
    throw Exception('Failed to create todo, error code ${res.statusCode}');
  }
}

Future<bool> updateTodo(Todo todo) async {
  final res = await http.put(
      'https://jsonplaceholder.typicode.com/todos/${todo.id}',
      headers: headers,
      body: json.encode(todo));

  if (res.statusCode == 200) {
    return true;
  } else {
    throw Exception(
        'Failed to update todo with id ${todo.id}, error code ${res.statusCode}');
  }
}

Future<bool> deleteTodo(int id) async {
  final res = await http.delete(
      'https://jsonplaceholder.typicode.com/todos/$id',
      headers: headers);

  if (res.statusCode == 200) {
    return true;
  } else {
    throw Exception(
        'Failed to delete todo with id $id, error code ${res.statusCode}');
  }
}
