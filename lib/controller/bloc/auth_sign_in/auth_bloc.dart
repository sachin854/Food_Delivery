import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../services/rest_api/client.dart';
import '../../../ui/home_screen/home_page.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()){
    on<GoogleSignInTapEvent>((event, emit) async{
      await googleSignInPressed(event, emit);
    });
  }


  Future googleSignInPressed(GoogleSignInTapEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    User? user;
    try {
      user = await RestApiClientService.signInWithGoogle(context: event.context);
      if (user != null) {
        emit(AuthSuccessState(user));
        print("Authentication Success");
        Navigator.of(event.context).pushNamed(HomePage.routeName);
      } else {
        emit(AuthErrorState("Authentication failed."));
      }
    } catch (error) {
      emit(AuthErrorState("An error occurred: $error"));
    }
  }


}