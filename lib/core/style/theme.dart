import 'package:flutter/material.dart';
import 'package:riverpod_starter_project/core/style/text_styles.dart';

import 'colors.dart';

ThemeData theme = ThemeData(
  canvasColor: Colors.white,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    centerTitle: true,
    shadowColor: Colors.transparent,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: secondaryColor,
    unselectedItemColor: greyColor,
    selectedLabelStyle: headline5Style,
    unselectedLabelStyle: headline5Style,
  ),
  textTheme: const TextTheme(
    displayLarge: headline1Style,
    displayMedium: headline2Style,
    displaySmall: headline3Style,
    headlineMedium: headline4Style,
    headlineSmall: headline5Style,
    bodyLarge: bodyStyle,
    bodySmall: linkStyle,
  ),
  primaryColor: secondaryColor,
  focusColor: secondaryColor,
  disabledColor: lightGreyColor,
  inputDecorationTheme: InputDecorationTheme(
    errorStyle: const TextStyle(fontSize: 16),
    errorBorder: buildOutlineInputBorder(errorColor),
    focusedErrorBorder: buildOutlineInputBorder(errorColor),
    focusedBorder: buildOutlineInputBorder(secondaryColor),
    border: buildOutlineInputBorder(greyColor).copyWith(
      borderRadius: BorderRadius.circular(3),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(primary: primaryColor)
      .copyWith(secondary: secondaryColor)
      .copyWith(error: errorColor)
      .copyWith(background: Colors.white),
);

OutlineInputBorder buildOutlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderSide: buildBorderSide(color),
  );
}

BorderSide buildBorderSide(Color color) {
  return BorderSide(
    color: color,
  );
}
