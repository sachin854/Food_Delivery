abstract class SignUpEvent{}
class SignUpNumberChangedEvent extends SignUpEvent{
  final String number;
  SignUpNumberChangedEvent(this.number);
}

class SignUpEmailChangedEvent extends SignUpEvent{
  final String email;
  SignUpEmailChangedEvent(this.email);
}

class SignUpPasswordChangedEvent extends SignUpEvent{
  final String password;
  SignUpPasswordChangedEvent(this.password);
}

class SignUpSubmitEvent extends SignUpEvent{
  final String number;
  final String email;
  final String password;
  SignUpSubmitEvent(this.number, this.email, this.password);
}