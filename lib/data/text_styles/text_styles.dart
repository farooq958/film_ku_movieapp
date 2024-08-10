import 'package:film_ku/data/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle merriBold({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.merriweather(
        fontSize: fontSize ?? 15,
        letterSpacing: letterSpacing ?? 0,
        color: color??AppColors.primaryColor,
        fontWeight: fontWeight ?? FontWeight.bold);
  }

  static TextStyle merriMedium({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.merriweather(
        fontSize: fontSize ?? 14,
        letterSpacing: letterSpacing ?? 0,
        color: color??AppColors.primaryColor,
        fontWeight: fontWeight ?? FontWeight.w500);
  }

  static TextStyle merriRegular({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.merriweather(
        fontSize: fontSize ?? 13,
        letterSpacing: letterSpacing ?? 0,
        color: color ?? AppColors.primaryColor,
        fontWeight: fontWeight ?? FontWeight.normal);
  }

  static TextStyle mulishBold({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.mulish(
        fontSize: fontSize ?? 15,
        letterSpacing: letterSpacing ?? 0,
        color: color??AppColors.primaryColor,
        fontWeight: fontWeight ?? FontWeight.bold);
  }

  static TextStyle mulishMedium({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.mulish(
        fontSize: fontSize ?? 14,
        letterSpacing: letterSpacing ?? 0,
        color: color??AppColors.primaryColor,
        fontWeight: fontWeight ?? FontWeight.w500);
  }

  static TextStyle mulishRegular({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.mulish(
        fontSize: fontSize ?? 13,
        letterSpacing: letterSpacing ?? 0,
        color: color ?? AppColors.primaryColor,
        fontWeight: fontWeight ?? FontWeight.normal);
  }
}