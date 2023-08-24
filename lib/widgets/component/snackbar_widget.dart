import 'package:flutter/material.dart';
import '../../resources/constants/color.dart';

class SnackBarWidget {
  SnackBarWidget._();

  static Future<void> show(
      {required String message,
        required BuildContext context,
        String? title}) async {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          message ?? "",
          style: const TextStyle(
            color: AppColor.whiteColor
          ),
        ),
        backgroundColor: AppColor.primaryColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}