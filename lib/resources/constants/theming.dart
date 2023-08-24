import 'package:flutter/material.dart';
import 'color.dart';
import 'font_weight.dart';
import 'padding.dart';

class Theming{
  static InputDecorationTheme inputDecorationTheming =  InputDecorationTheme(
    contentPadding:  const EdgeInsets.symmetric(vertical: Paddings.textFormFieldPadding, horizontal: Paddings.textFormFieldPadding),
    hintStyle: const TextStyle(
      color: AppColor.primaryColor,
      fontWeight: AppFontWeight.medium,
    ),
    focusedBorder:  OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(Paddings.buttonRadius)),
        borderSide: BorderSide(
            color: AppColor.primaryColor.withOpacity(0.3)
        )
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(Paddings.buttonRadius)),
        borderSide: BorderSide(
            color: AppColor.primaryColor.withOpacity(0.3)
        )
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Paddings.buttonRadius)),
    ),
    labelStyle: const TextStyle(
        color: AppColor.primaryColor,
        fontSize: AppFontWeight.font16,
        fontWeight: AppFontWeight.medium
    ),
    errorStyle: const TextStyle(
        color: AppColor.primaryColor
    ),
  );

  static TextSelectionThemeData textSelectionTheming = const TextSelectionThemeData(
      cursorColor: AppColor.primaryColor,
      selectionColor: AppColor.primaryColor,
      selectionHandleColor: AppColor.primaryColor
  );
}