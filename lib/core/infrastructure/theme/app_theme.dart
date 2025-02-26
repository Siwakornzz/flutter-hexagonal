import 'package:flutter/material.dart';
import 'fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    fontFamily: AppFonts.prompt,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headlineSmall: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 12),
      bodyMedium: TextStyle(fontSize: 14),
      bodyLarge: TextStyle(fontSize: 16),
    ),
  );
}
