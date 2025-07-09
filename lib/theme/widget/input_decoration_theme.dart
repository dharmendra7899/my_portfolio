part of "../theme.dart";

final _inputDecorationTheme = InputDecorationTheme(
  iconColor: appColors.barColor,
  errorStyle: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: appColors.error,
    fontFamily: 'Poppins',
  ),
  errorMaxLines: 3,
  fillColor: appColors.appWhite,
  prefixIconColor: appColors.barColor,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: appColors.borderColor, width: 2),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: appColors.borderColor, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: appColors.borderColor, width: 2),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: appColors.error, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: appColors.error, width: 2),
  ),
);
