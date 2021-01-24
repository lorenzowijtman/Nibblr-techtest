import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todoapp/src/models/todo.dart';
import 'package:todoapp/src/services/todoService.dart';
import 'package:todoapp/src/styles/styles.dart';
import 'package:todoapp/src/views/todopage.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  TodoItem({this.todo});

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool complete;

  @override
  void initState() {
    super.initState();
    complete = widget.todo.complete;
  }

  void onCheck(bool checked) {
    Todo updated = widget.todo;
    updated.complete = checked;
    updateTodo(updated).then(
        (value) => {
              setState(() {
                complete = checked;
              })
            }, onError: (e) {
      log(e.toString());
      // Handle update error visually
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: GestureDetector(
          onLongPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TodoPage(
                          title: 'Edit Todo',
                          todo: widget.todo,
                        )));
          },
          child: ExpansionTile(
            trailing: Checkbox(
              value: complete,
              onChanged: onCheck,
              checkColor: Colors.white,
              activeColor: Styles.green,
            ),
            title: Text(
              widget.todo.title,
              style: Styles.accordionTitle,
            ),
            children: [
              ListTile(
                title: Text(widget.todo.description,
                    style: Styles.descriptionText),
              ),
            ],
          ),
        ));
  }
}
