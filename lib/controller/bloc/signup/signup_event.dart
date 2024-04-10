abstract class SignUpEvent{}
class SignUpNumberChangedEvent extends SignUpEvent{
  final String number;
  SignUpNumberChangedEvent(this.number);
}

class SignUpEmailChangedEvent extends SignUpEvent{
  final String email;
  SignUpEmailChangedEvent(this.email);
}

class SignUpNameChangedEvent extends SignUpEvent{
  final String name;
  SignUpNameChangedEvent(this.name);
}

class SignUpSubmitEvent extends SignUpEvent{
  final String number;
  final String email;
  final String name;
  SignUpSubmitEvent(this.number, this.email, this.name);
}

class SignUpSendOtpEvent extends SignUpEvent {
  final String phoneNumber;
  SignUpSendOtpEvent(this.phoneNumber);
}

class SignUpOnFirebaseOtpSentEvent extends SignUpEvent {
  final int token;
  final String verificationId;
  SignUpOnFirebaseOtpSentEvent(this.verificationId, this.token);
}

class SignUpVerifyErrorEvent extends SignUpEvent {
  final String error;
  SignUpVerifyErrorEvent(this.error);
}

class SignUpVerifyOtpEvent extends SignUpEvent {
  final String otpCode;
  final String verificationId;
  final String phNo;
  SignUpVerifyOtpEvent(this.otpCode, this.verificationId, this.phNo);
}