import 'package:flutter/material.dart';
import 'package:gustavo_2_0/theme/colors_theme.dart';

ThemeData DefaultTheme = ThemeData(
  primaryColor: ThemeColors.primaryColor,
  appBarTheme: const AppBarTheme(color: ThemeColors.primaryColor),
  elevatedButtonTheme: ElevatedButtonThemeData(style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.primaryColor))),
  floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: ThemeColors.primaryColor),
);
