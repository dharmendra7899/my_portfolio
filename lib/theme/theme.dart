import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/colors.dart';

part 'widget/app_bar_theme.dart';

part 'widget/bottom_sheet_theme.dart';

part 'widget/check_box_theme.dart';

part 'widget/divider_theme.dart';

part 'widget/elevated_button_theme.dart';

part 'widget/expansion_tile_theme.dart';

part 'widget/input_decoration_theme.dart';

part 'widget/search_bar_theme.dart';

part 'widget/text_theme.dart';

part 'widget/tooltip_theme.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark(useMaterial3: true);

  static final lightThemeMode = ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: appColors.onSurface),
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      elevation: 2,
      insetPadding: EdgeInsets.symmetric(horizontal: 14),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        color: appColors.titleColor,
        fontSize: 16,
      ),
      contentTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color: appColors.titleColor,
        fontSize: 14,
      ),
    ),
    scaffoldBackgroundColor: appColors.appWhite,
    inputDecorationTheme: _inputDecorationTheme,
    textTheme: _textTheme,
    dividerTheme: _dividerTheme,
    bottomSheetTheme: _bottomSheetTheme,
    appBarTheme: _appBarTheme,
    checkboxTheme: _checkBoxTheme,
    searchBarTheme: _searchBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    expansionTileTheme: _expansionTileTheme,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: appColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: appColors.secondary, width: 2),
        ),
      ),
    ),
    tooltipTheme: _tooltipTheme,
  );
}
