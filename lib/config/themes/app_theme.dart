import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.teal,
  Colors.deepOrange,
  Colors.blue,
  Colors.green,
  Colors.pink,
  Colors.brown,
  Colors.purple,
  Colors.yellow,
  Colors.orange,
  Colors.lightGreen,
  Colors.lightBlue,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal to ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
}
