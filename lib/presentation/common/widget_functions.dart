
import 'package:film_ku/data/colors/app_colors.dart';
import 'package:film_ku/data/text_styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class WidgetFunctions {
  WidgetFunctions._private();

  static final instance = WidgetFunctions._private();

  showErrorSnackBar({String? error, required BuildContext context}) {
    WidgetFunctions.instance.snackBar(context,
        text: error,
        bgColor: AppColors.error,
        textStyle:
            AppTextStyles.merriMedium( color: Colors.white));
  }

  Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>> snackBar(
      BuildContext context,
      {String? text,
      Color? bgColor,
      TextStyle? textStyle}) async {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text ?? "",
        style: textStyle ??
            AppTextStyles.merriMedium( ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      duration: const Duration(milliseconds: 1000),
     backgroundColor: bgColor ?? AppColors.primaryColor,
      behavior: SnackBarBehavior.floating,
      shape: Theme.of(context).snackBarTheme.shape,
    ));
  }

  Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>> toast(
      BuildContext context, SnackBar snackBar) async {
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }





}
