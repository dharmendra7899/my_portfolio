import 'package:flutter/material.dart';


extension AppContextExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);

  ColorScheme get colorScheme => themeData.colorScheme;

  TextTheme get textTheme => themeData.textTheme;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get statusBarHeight => MediaQuery.of(this).padding.top;
}
