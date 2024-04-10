import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpState{}

class SignUpInitialState extends SignUpState{}

class SignUpValidState extends SignUpState{}

class SignUpNumberErrorState extends SignUpState{
  final String number;
  SignUpNumberErrorState(this.number);
}

class SignUpEmailErrorState extends SignUpState{
  final String email;
  SignUpEmailErrorState(this.email);
}
class SignUpFullNameErrorState extends SignUpState{
  final String fullName;
  SignUpFullNameErrorState(this.fullName);
}


class SignUpAllErrorState extends SignUpState{
  final String number;
  final String email;
  final String fullName;
  SignUpAllErrorState(this.number, this.email, this.fullName);
}
class SignUpInvalidState extends SignUpState{
  final String errorMessage;
  SignUpInvalidState(this.errorMessage);
}

class SignUpLoadingState extends SignUpState{}

class SignUpOnFirebaseOtpSentState extends SignUpState{
  final int token;
  final String verificationId;
  SignUpOnFirebaseOtpSentState(this.verificationId, this.token);
}

class SignUpLoadedState extends SignUpState{
  final AuthCredential credential;
  SignUpLoadedState(this.credential);
}
