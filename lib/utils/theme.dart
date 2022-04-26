import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: Colors.lightBlue[800],
  fontFamily: 'Georgia',
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
);

const Color mainColor = Color.fromRGBO(144, 202, 249, 1);
