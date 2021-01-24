import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/src/models/todo.dart';
import 'package:todoapp/src/services/todoService.dart';
import 'package:todoapp/src/views/homepage.dart';
import 'package:todoapp/src/widgets/generic/customButtonBar.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key key, this.title, this.todo}) : super(key: key);

  final String title;
  final Todo todo;

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _formKey = GlobalKey<FormState>();

  String todoTitle;
  String description;

  @override
  void initState() {
    super.initState();
    todoTitle = widget.todo?.title ?? "";
    description = widget.todo?.description ?? "";
  }

  //Simple function to make the code below little easier to read.
  navigateHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  callCreateTodo() {
    createTodo(
            Todo(title: todoTitle, description: description, complete: false))
        .then(
            (value) => {
                  //success
                  navigateHome()
                }, onError: (e) {
      //handle update error
      log(e.toString());
    });
  }

  callUpdateTodo() {
    Todo updated = widget.todo;
    updated.title = todoTitle;
    updated.description = description;
    updateTodo(updated).then(
        (value) => {
              //success
              navigateHome()
            }, onError: (e) {
      //handle create error
      log(e.toString());
    });
  }

  saveCall() {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      if (widget.todo == null) {
        //save as new todo
        callCreateTodo();
      } else {
        //update the todo
        callUpdateTodo();
      }
    }
  }

  deleteCall() {
    // Delete item
    deleteTodo(widget.todo.id).then((value) => {navigateHome()}, onError: (e) {
      //handle delete error
      log(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: Stack(
        children: [
          ListView(
            children: [
              Form(
                  key: _formKey,
                  child: Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      child: (Container(
                          child: (Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(hintText: 'Title'),
                                initialValue: todoTitle,
                                onSaved: (String value) {
                                  setState(() {
                                    todoTitle = value;
                                  });
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(hintText: 'Description'),
                                initialValue: description,
                                onSaved: (String value) {
                                  setState(() {
                                    description = value;
                                  });
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ],
                      )))))),
            ],
          ),
          Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButtonBar(
                    saveCall: saveCall,
                    deleteCall: ((widget.todo != null) ? deleteCall : null)),
              ])
        ],
      )),
    );
  }
}
