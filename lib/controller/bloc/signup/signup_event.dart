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