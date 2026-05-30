import 'package:flutter/material.dart';
import 'package:learn_bloc/core/theme/app_pallete.dart';

class AppTheme {
  static OutlineInputBorder _border([
    Color color = AppPallete.borderColor,
  ]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color, width: 3),
  );

  static ThemeData get darkThemeMode =>
      ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppPallete.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppPallete.backgroundColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: _border(),
          focusedBorder: _border(AppPallete.gradient2),
        ),
      );
}
