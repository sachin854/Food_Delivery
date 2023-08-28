
import 'package:dio/dio.dart';
import 'package:finalapppp/controller/bloc/authentication/signIn/sign_state.dart';
import 'package:finalapppp/controller/bloc/authentication/signIn/signin_event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/rest_api/client.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{

  final auth = FirebaseAuth.instance;
  RestApiClientService? phoneAuthRepository;
  SignInBloc() : super(SignInInitialState()){
    on<SignInSendOtpEvent>((event , emit )   async{
      phoneAuthRepository = RestApiClientService.shared;
      emit(SignInLoadingState());
      try {
        await phoneAuthRepository!.verifyPhone(
          phoneNumber: event.phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            emit(SignInLoadedState(credential));
          },
          codeSent: (String verificationId, int? resendToken) {
            add(SignInOnFirebaseOtpSentEvent(verificationId, resendToken!));
          },
          verificationFailed: (FirebaseAuthException e) {
            add(SignInVerifyErrorEvent(e.code));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      }  catch (e) {
        print(e.toString());
        emit(SignInErrorState(e.toString()));
      }
    });
    on<SignInVerifyOtpEvent>((event , emit ) {
      print(event.verificationId);
      print(event.otpCode);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otpCode,
      );
      emit(SignInLoadedState(credential));
    });

    on<SignInOnFirebaseOtpSentEvent>((event , emit ) {
      emit(SignInOnFirebaseOtpSentState(event.verificationId, event.token));
    });

    on<SignInVerifyErrorEvent>((event , emit ) {
      emit(SignInErrorState(event.error));
    });

    on<SignInSuccessEvent>(loginWithCredential);
  }

  Future<void> loginWithCredential(SignInSuccessEvent event, Emitter<SignInState> emit) async {
    try {
      await auth.signInWithCredential(event.credential).then((user) async {
        String? fcmToken = await FirebaseMessaging.instance.getToken();
        User? currentUser = FirebaseAuth.instance.currentUser;

        String? idToken = await currentUser!.getIdToken();
        print("id token....."+idToken.toString());
        print("fcm token....."+fcmToken.toString());

        // if (currentUser != null) {
        await setToken(idToken!).then((value) => {
          print("........set token .....verified...."+value.toString()),
          loginProfile(),
        });
        print("........on login.....verified....");
        //}

      });
    } on FirebaseAuthException catch (e) {
      emit(SignInErrorState(e.code));
    } catch (e) {
      print(e.toString());
      emit(SignInErrorState(e.toString()));
    }
  }
  Future setToken(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_token', token);
    await RestApiClientService.shared.setToken();
    print("set token signin bloc...:"+prefs.getString('user_token').toString());
    return token;
  }



  Future<dynamic> loginProfile() async {
    try {
      print("userprofile---");
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final result = await RestApiClientService.shared.loginData();
      print(result);
      if(result == 'isExisting'){
        // preferences.setBool('exist', true);
        emit(SignInVerifiedState(isExisting: false));

      }else if(result == 'isEmpty'){
        // preferences.setBool('exist', false);
        emit(SignInErrorState("Something Went Wrong"));
      }
      else {
        preferences.setString('userID', result['_id'].toString());
        emit(SignInVerifiedState(isExisting: true));
      }
      return result;
    } on DioError catch (error) {
      if (error.response?.statusCode == 404) {
        if (error.response?.data != null) {
          print("data ...response error..." + error.response!.data["message"].toString());
        }
        emit(SignInVerifiedState(isExisting: false));
      } else {
        print(error.message);
        throw error;
      }
    }
  }
}

