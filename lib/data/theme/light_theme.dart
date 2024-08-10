import 'package:film_ku/data/colors/app_colors.dart';
import 'package:flutter/material.dart';

mixin LightTheme {
  ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primaryColor,
          onPrimary: AppColors.backgroundColor,
          secondary: AppColors.secondaryColor,
          outline: AppColors.outlineColor,
          outlineVariant: AppColors.onOutlineColor,
          onSecondary: AppColors.secondaryLightColor,
          error: AppColors.error,
          onError: AppColors.backgroundColor,
          surface: AppColors.primaryColor,
          onSurface: AppColors.backgroundColor,
        ),
      );
}
