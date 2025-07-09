// main.dart
import 'package:flutter/material.dart';
import 'package:my_portfolio/sections/portfolio_page.dart';

import 'package:my_portfolio/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: AppTheme.lightThemeMode,
        darkTheme: AppTheme.darkThemeMode,
        locale: Locale('en'),
        debugShowCheckedModeBanner: false,
        title: 'My Portfolio',
        home: const PortfolioPage());
  }
}
