abstract class OtpState{}

class OtpInitialState extends OtpState{}

class OtpValidState extends OtpState{}

class OtpErrorState extends OtpState{
  final String error;
  OtpErrorState(this.error);
}