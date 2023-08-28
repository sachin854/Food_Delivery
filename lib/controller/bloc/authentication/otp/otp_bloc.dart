import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_event.dart';
import 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {

  OtpBloc() : super(OtpInitialState()) {
    on<VerifyOtp>((event , emit){
      emit(OtpValidState());
    });
  }
}