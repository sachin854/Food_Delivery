import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInState{}

class SignInInitialState extends SignInState{}

class SignInLoadingState extends SignInState{}

class SignInErrorState extends SignInState{
  final String error;
  SignInErrorState(this.error);
}

class SignInLoadedState extends SignInState{
  final AuthCredential credential;
  SignInLoadedState(this.credential);
}

class SignInOnFirebaseOtpSentState extends SignInState{
  final int token;
  final String verificationId;
  SignInOnFirebaseOtpSentState(this.verificationId, this.token);
}

class SignInVerifiedState extends SignInState{
  final  bool isExisting;
  SignInVerifiedState({required this.isExisting});
}

class  SignInOtpSentSuccessState extends SignInState{
  final String verificationId;
  final String otpCode;
  SignInOtpSentSuccessState(this.verificationId, this.otpCode);
}