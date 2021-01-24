import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/src/styles/styles.dart';

import 'views/homepage.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Styles.theme,
      home: HomePage(),
    );
  }
}
