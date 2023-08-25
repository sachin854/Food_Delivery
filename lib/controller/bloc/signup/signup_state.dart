abstract class SignUpState{}

class SignUpInitialState extends SignUpState{}

class SignUpValidState extends SignUpState{}

class SignUpNumberErrorState extends SignUpState{
  final String number;
  SignUpNumberErrorState(this.number);
}

class SignUpEmailChangeState extends SignUpState{
  final String email;
  SignUpEmailChangeState(this.email);
}
class SignUpPasswordErrorState extends SignUpState{
  final String password;
  SignUpPasswordErrorState(this.password);
}


class SignUpAllErrorState extends SignUpState{
  final String number;
  final String email;
  final String password;
  SignUpAllErrorState(this.number, this.email, this.password);
}
class SignUpInvalidState extends SignUpState{
  final String errorMessage;
  SignUpInvalidState(this.errorMessage);
}

class SignUpLoadingState extends SignUpState{}

