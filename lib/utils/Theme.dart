// lib/theme/app_theme.dart
import 'package:curriculum_vitae/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData customTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark, // since your base is dark
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      error: AppColors.error,
      onError: AppColors.onError,
    ),
  );
}
