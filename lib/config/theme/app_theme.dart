import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.purple,
  Colors.blue,
  Colors.black,
  Colors.lightBlueAccent,
  Colors.red,
  Colors.teal
];

class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor = 0})
      : assert(selectColor >= 0, "Selected color must be greater then 0"),
        assert(selectColor < colorList.length,
            "Selected color must be less or equals then ${colorList.length - 1}");

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}