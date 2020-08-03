import 'package:flutter/material.dart';

const hsosBlue = Color(0xFF009FE3);
const hsosGrey = Color(0xFFC6C6C6);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: hsosBlue,
  primaryColorBrightness: Brightness.dark,
  accentColor: hsosGrey,
  accentColorBrightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: hsosBlue,
  primaryColorBrightness: Brightness.dark,
  accentColor: hsosGrey,
  accentColorBrightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
