import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  iconTheme: IconThemeData(
    color: Colors.grey[600],
  ),
  colorScheme: ColorScheme.dark(
    // background: Colors.black,
    surface: Colors.black12,
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!,
    onSecondary: Colors.grey[400]!,
    onPrimary: Colors.grey[300]!,
    // chat------
    onSurface: Colors.white,

    // subcripton---
    onPrimaryContainer: Colors.grey[900],
  ),
);
