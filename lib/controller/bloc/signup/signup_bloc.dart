import 'package:finalapppp/controller/bloc/signup/signup_event.dart';
import 'package:finalapppp/controller/bloc/signup/signup_state.dart';
import 'package:bloc/bloc.dart';
import 'package:finalapppp/ui/authentication/verify_otp.dart';
import 'package:finalapppp/ui/home_screen/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../generated/l10n.dart';
import '../../../services/rest_api/client.dart';
import '../authentication/signIn/sign_state.dart';
class SignUpBloc extends Bloc<SignUpEvent,SignUpState>{
  BuildContext? context;
  SignUpBloc() :super(SignUpInitialState()){

    final auth = FirebaseAuth.instance;
    RestApiClientService? phoneAuthRepository;

    on<SignUpSendOtpEvent>((event , emit )   async{
      phoneAuthRepository = RestApiClientService.shared;

      // emit(SignInLoadingState() as SignUpState);
      try {
        await phoneAuthRepository!.verifyPhone(
          phoneNumber: event.phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            emit(SignUpLoadedState(credential));
          },
          codeSent: (String verificationId, int? resendToken) {
            add(SignUpOnFirebaseOtpSentEvent(verificationId, resendToken!));
          },
          verificationFailed: (FirebaseAuthException e) {
            add(SignUpVerifyErrorEvent(e.code));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      }  catch (e) {
        print(e.toString());
        emit(SignInErrorState(e.toString()) as SignUpState);
      }
    });

    on<SignUpVerifyOtpEvent>((event , emit ) {
      print(event.verificationId);
      print(event.otpCode);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otpCode,
      );
      emit(SignInLoadedState(credential) as SignUpState);
    });

    on<SignUpNameChangedEvent>(nameEvent);

    on<SignUpNumberChangedEvent>(numberEvent);

    on<SignUpEmailChangedEvent>(emailEvent);

    on<SignUpSubmitEvent>((event, emit) {
      if (event.name.isEmpty && event.email.isEmpty && event.number.isEmpty) {
        emit(SignUpAllErrorState("Please enter fullname", "Please enter email", "Please enter number"));
        return;
      } else if (event.name.isEmpty) {
        emit(SignUpFullNameErrorState("Please enter fullname"));
        return;
      }
      else if (event.email.isEmpty) {
        emit(SignUpEmailErrorState("Please enter email"));
        return;
      }else if(event.number.isEmpty){
        emit(SignUpNumberErrorState("Please select number "));
      }
      else {
        emit(SignUpLoadingState());
        didSignUpPressed(number: event.number, email: event.email, fullname: event.name);
        print("bloccc"+event.number);
        print("bloccc"+event.email);
        print("bloccc"+event.name);
        Navigator.pushNamed(context!, VerifyOtpScreen.routeName);
      }
    });
  }


  void setName(BuildContext context, String name) {
    this.context = context;
    add(SignUpNameChangedEvent(name));
  }
  void setNo(BuildContext context, String number) {
    this.context = context;
    add(SignUpNumberChangedEvent(number));
  }
  void setEmail(BuildContext context, String email) {
    this.context = context;
    add(SignUpEmailChangedEvent(email));
  }
  void nameEvent(SignUpNameChangedEvent event, Emitter<SignUpState> emit){
    if(event.name == ""){
      emit(SignUpFullNameErrorState("Please enter fullname"));
    }
    else{
    }
  }

  void emailEvent(SignUpEmailChangedEvent event, Emitter<SignUpState> emit){
    if(event.email == ""){
      emit(SignUpEmailErrorState("Please enter email"));
    }
    else{
    }
  }

  void numberEvent(SignUpNumberChangedEvent event, Emitter<SignUpState> emit){
    if(event.number == ""){
      emit(SignUpNumberErrorState("Please enter number"));
    }
    else{
    }
  }

   Future didSignUpPressed({
    required String number,
    required String email,
    required String fullname,
  }) async {
    // try {
      final result = await RestApiClientService.shared.signUpPressed(
          number: number,
          email: email,
          fullname: fullname
      );
      print("nn"+number.toString());
      print("ee"+email.toString());
      print("ff"+fullname.toString());
      // ignore: invalid_use_of_visible_for_testing_member
      emit(SignUpValidState());
      Navigator.pushNamed(context!, VerifyOtpScreen.routeName);
      return;
      // RestApiClientService.shared.setToken();

    }
    // catch (error) {
    //   // ignore: invalid_use_of_visible_for_testing_member
    //   emit(SignUpInvalidState(error.toString()));

    // }
  // }

}