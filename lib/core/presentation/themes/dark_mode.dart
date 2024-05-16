import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    colorScheme: const ColorScheme.dark(
  background: Color.fromRGBO(13, 13, 15, 1),
  primaryContainer: Color.fromRGBO(22, 22, 25, 1),
  primary: Color.fromRGBO(255, 255, 255, 1),
  secondary: Color.fromRGBO(225, 225, 229, 1),
  secondaryContainer: Color.fromRGBO(62, 63, 72, 1),
  tertiary: Color.fromRGBO(0, 202, 69, 1),
  error: Color.fromRGBO(228, 12, 12, 1),
)).copyWith(
    indicatorColor: const Color.fromRGBO(231, 181, 0, 1),
    textTheme: const TextTheme(
        caption: TextStyle(
      color: Color.fromRGBO(177, 177, 184, 1),
    )));
