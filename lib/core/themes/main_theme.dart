import 'package:flutter/material.dart';

final appTheme = ThemeData(
  fontFamily: 'SourGummy',
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    secondary: Colors.amber,
  ),
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 3,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      disabledBackgroundColor: Colors.grey[400],
      disabledForegroundColor: Colors.grey[500],
    ),
  ),
);
