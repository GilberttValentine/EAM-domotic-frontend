import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class ButtonPalette {
  late Color background;
  late Color border;
  late Color text;
  late Color hover;
  late Color borderHover;
  late Color textHover;
  Color disabled = const Color.fromARGB(0, 0, 0, 1);

  ButtonPalette({required String type}) {
    switch (type) {
      case 'primary':
        background = AppTheme.primaryColor;
        border = AppTheme.primaryColor;
        text = Colors.black;
        hover = AppTheme.primaryHoverColor;
        borderHover = AppTheme.primaryHoverColor;
        textHover = Colors.white;
        break;
      case 'danger':
        background = AppTheme.dangerColor;
        border = AppTheme.dangerColor;
        text = Colors.black;
        hover = AppTheme.dangerHoverColor;
        borderHover = AppTheme.dangerHoverColor;
        textHover = Colors.white;
        break;
      case 'success':
        background = AppTheme.successColor;
        border = AppTheme.successColor;
        text = Colors.black;
        hover = AppTheme.successHoverColor;
        borderHover = AppTheme.successHoverColor;
        textHover = Colors.white;
        break;
      case 'warning':
        background = AppTheme.warningColor;
        border = AppTheme.warningColor;
        text = Colors.black;
        hover = AppTheme.warningHoverColor;
        borderHover = AppTheme.warningHoverColor;
        textHover = Colors.black;
        break;
      default:
        background = AppTheme.defaultColor;
        border = AppTheme.defaultColor;
        text = Colors.black;
        hover = AppTheme.defaultHoverColor;
        borderHover = AppTheme.defaultHoverColor;
        textHover = Colors.black;
    }
  }
}
