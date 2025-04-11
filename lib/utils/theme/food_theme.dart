import 'package:flutter/material.dart';

class FoodTheme {
  FoodTheme();

  static ThemeData lightMode = ThemeData(
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Colors.black),
      headlineMedium: TextStyle(color: Colors.black),
      headlineSmall: TextStyle(color: Colors.black),
      labelLarge: TextStyle(color: Colors.black),
      labelMedium: TextStyle(color: Colors.black),
      labelSmall: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
      displayLarge: TextStyle(color: Colors.black),
      displayMedium: TextStyle(color: Colors.black),
      displaySmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
    ),
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade200,
      primary: Colors.blue.shade400,
      secondary: Colors.blueGrey.shade100,
      tertiary: Colors.white,
      inversePrimary: Colors.blueGrey.shade400,
      inverseSurface: Colors.grey.shade50,
      onInverseSurface: Colors.black,
    ),
  );

  static ThemeData darkMode = ThemeData(
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
      labelMedium: TextStyle(color: Colors.white),
      labelSmall: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white),
      displayMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
    ),
    colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.blue.shade400,
      secondary: Colors.blueGrey.shade600,
      tertiary: Colors.black,
      inversePrimary: Colors.blueGrey.shade200,
      inverseSurface: Colors.black12,
      onInverseSurface: Colors.white,
    ),
  );
}
