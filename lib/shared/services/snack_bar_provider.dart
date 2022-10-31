import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class SnackBarProvider {
  SnackBarProvider(
      {required BuildContext context,
      required String message,
      String status = ''}) {
    final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: snackBarColor(status),
        content: Text(
          message,
          style: const TextStyle(
              fontFamily: AppTheme.poppinsFontFamily, fontSize: 14),
        ));

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Color snackBarColor(String status) {
    switch (status) {
      case 'error':
        return AppTheme.dangerColor;
      default:
        return AppTheme.defaultSnackBarColor;
    }
  }
}
