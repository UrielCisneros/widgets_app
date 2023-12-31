import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.black,
  Colors.green,
  Colors.purple,
  Colors.blue,
  Colors.black,
  Colors.lightBlueAccent,
  Colors.red,
  Colors.teal
];

class AppTheme {
  final int selectColor;
  final bool isDarkMode;

  AppTheme({this.selectColor = 0, this.isDarkMode = false})
      : assert(selectColor >= 0, "Selected color must be greater then 0"),
        assert(selectColor < colorList.length,
            "Selected color must be less or equals then ${colorList.length - 1}");

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectColor],
      appBarTheme: const AppBarTheme(centerTitle: false));

//Comn el coyWith hacemos una copia de la instancia, pero pasamos por parametros los datos que queremos cambiar
  AppTheme copyWith({int? selectColor, bool? isDarkMode}) => AppTheme(
      selectColor: selectColor ?? this.selectColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}
