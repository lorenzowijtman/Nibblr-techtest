import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/src/styles/styles.dart';
import 'package:todoapp/src/views/todopage.dart';
import 'package:todoapp/src/widgets/todoList.dart';

class HomePage extends StatelessWidget {
  HomePage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Container(
        color: Styles.off_white,
        child: ListView(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            children: [
              TodoList(),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.green,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TodoPage(title: 'New Todo')));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
