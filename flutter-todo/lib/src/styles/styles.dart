import 'package:flutter/material.dart';

abstract class Styles {
  // Color definitions
  static const Color off_white = Color.fromRGBO(247, 247, 247, 1.0);
  static const Color yellow = Color.fromRGBO(255, 209, 102, 1.0);
  static const Color red = Color.fromRGBO(235, 30, 78, 1.0);
  static const Color green = Color.fromRGBO(6, 214, 106, 1.0);
  static const Color blue = Color.fromRGBO(17, 138, 178, 1.0);
  static const Color black = Color.fromRGBO(3, 29, 37, 1.0);
  static const Color gray = Color.fromRGBO(141, 153, 147, 1.0);

  static ThemeData theme = ThemeData(
    primaryColor: blue,
    accentColor: black,
  );
  // Title of a to-do item
  static const TextStyle accordionTitle =
      TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: black,
      );

  static const TextStyle descriptionText = TextStyle(
    fontSize: 16.0,
    color: black,
  );

  static const TextStyle formLabel = TextStyle(
    fontSize: 16.0,
    color: black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonText = TextStyle(
    color: Colors.white
  );

  static ButtonStyle completeButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(green)
  );

  static ButtonStyle editButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(yellow)
  );

  static ButtonStyle deleteButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(red),
  );
  static ButtonStyle cancelButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(gray),
  );

}
