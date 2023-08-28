import 'package:firebase_auth/firebase_auth.dart';


abstract class SignInEvent {
}

class SignInSendOtpEvent extends SignInEvent {
  final String phoneNumber;
  SignInSendOtpEvent(this.phoneNumber);
}

class SignInVerifyOtpEvent extends SignInEvent {
  final String otpCode;
  final String verificationId;
  final String phNo;
  SignInVerifyOtpEvent(this.otpCode, this.verificationId, this.phNo);
}

class SignInVerifyEvent extends SignInEvent {
  SignInVerifyEvent();
}

class SignInOnFirebaseOtpSentEvent extends SignInEvent {
  final int token;
  final String verificationId;
  SignInOnFirebaseOtpSentEvent(this.verificationId, this.token);
}

class SignInAuthErrorEvent extends SignInEvent {
  final String error;
  SignInAuthErrorEvent(this.error);
}

class SignInSuccessEvent extends SignInEvent {
  final AuthCredential credential;
  SignInSuccessEvent(this.credential);
}

class SignInVerifyErrorEvent extends SignInEvent {
  final String error;
  SignInVerifyErrorEvent(this.error);
}

class SignInVerify extends SignInEvent {}
