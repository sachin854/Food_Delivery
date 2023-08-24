import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static bool validateEmail(BuildContext context, String email) {
    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }

  static bool validatePhone(BuildContext context, String phone) {
    final bool phoneValid = RegExp(r'(^(?:[+0]9)?[0-9]{6,10}$)').hasMatch(phone);
    return phoneValid;
  }
}