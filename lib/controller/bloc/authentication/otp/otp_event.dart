abstract class OtpEvent{}

class VerifyOtp extends OtpEvent{}

class OtpErrorEvent extends OtpEvent{
  final String error;
  OtpErrorEvent(this.error);
}