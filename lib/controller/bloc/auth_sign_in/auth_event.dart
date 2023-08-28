import 'package:flutter/material.dart';

abstract class AuthEvent {}

class GoogleSignInTapEvent extends AuthEvent {
  final BuildContext context;
  GoogleSignInTapEvent(this.context);
}