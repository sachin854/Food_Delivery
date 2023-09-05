import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/bloc/authentication/signIn/sign_state.dart';
import '../../controller/bloc/authentication/signIn/signin_bloc.dart';
import '../../controller/bloc/authentication/signIn/signin_event.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../utilities/keyboard.dart';
import '../../widgets/component/snackbar_widget.dart';
import '../../widgets/component/text_widget.dart';
import '../BottomBar/BottomBar.dart';
import '../home_screen/home_page.dart';
import '../sign_up/sign_up.dart';

class VerifyOtpScreen extends StatefulWidget {
  static const routeName = "/VerifyOtp";
  final Map res;
  const VerifyOtpScreen({Key? key, required this.res}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  Timer? _timer;
  int _seconds = 55;
  late String phoneNumber;
  late TextEditingController _codeController;
  bool hasError = false;
  final _otpFormKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";
  late SignInBloc _signInBloc;
  String? verificationId;
  SharedPreferences? prefs;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    _codeController = TextEditingController();
    _signInBloc = BlocProvider.of<SignInBloc>(context);
    phoneNumber = widget.res['phNo'];
    verificationId = widget.res['verificationId'];
    super.initState();
    startTimer();
  }

  @override
  void dispose() async {
    super.dispose();
    _timer?.cancel();
    _codeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInLoadedState) {
            _signInBloc.add(SignInSuccessEvent(state.credential));
          }
          if (state is SignInVerifiedState) {
            if (state.isExisting == true) {
              Navigator.pushNamed(context, BottomBar.routeName);
            } else {
              Navigator.pushNamed(context, SignUp.routeName);
            }
          }
          if (state is SignInErrorState) {
            SnackBarWidget.show(message: state.error, context: context);
          }
        },
        builder: (context, state) {
          if (state is SignInLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GestureDetector(
            onTap: () {
              KeyboardManager.unFocus(context);
            },
            child: SafeArea(
                child: SingleChildScrollView(
              child: Form(
                key: _otpFormKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 80),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back)),
                          Text(
                            'OTP code verification',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Code has been sent to $phoneNumber',
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 60, bottom: 40),
                      child: PinCodeTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        appContext: context,
                        pastedTextStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: true,
                        obscuringCharacter: '*',
                        obscuringWidget: Container(
                          alignment: Alignment.centerLeft,
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          activeFillColor: Colors.green.withOpacity(0.2),
                          inactiveColor: Colors.black.withOpacity(0.01),
                          inactiveFillColor: Colors.grey.withOpacity(0.1),
                          selectedFillColor: Colors.green.withOpacity(0.2),
                          selectedColor: Colors.green.withOpacity(0.2),
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(12),
                          activeColor: Colors.green.withOpacity(0.2),
                          fieldHeight: 40,
                          fieldWidth: 45,
                          fieldOuterPadding: const EdgeInsets.only(left: 5),
                        ),
                        cursorColor: Colors.grey,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        enablePinAutofill: true,
                        errorAnimationController: errorController,
                        controller: _codeController,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          debugPrint("Completed" + v.toString());
                        },
                        onChanged: (value) {},
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          return true;
                        },
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Verification in ',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(
                          height: Dimensions.dimen15,
                          width: Dimensions.dimen35,
                          child: TextWidget(
                            titleColor: AppColor.greenColor,
                            fontSize: 12,
                            title: _seconds == 0
                                ? "00:00"
                                : "00:${_seconds.toString().padLeft(2, '0')}",
                          ),
                        ),
                        Text(
                          'sec',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 30, bottom: 30, left: 16, right: 16),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  25), // Adjust the radius as needed
                            ),
                          ),
                          onPressed: () => {
                                _signInBloc.add(SignInVerifyOtpEvent(
                                    _codeController.text,
                                    verificationId!,
                                    phoneNumber)),
                              },
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ),
                    Center(
                      child: Row(
                        children: [
                          if (_seconds == 0)
                            Text(
                              'If you didn\'t receive OTP ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          if (_seconds == 0)
                            InkWell(
                              onTap: () {
                                _signInBloc.add(
                                    SignInSendOtpEvent(phoneNumber.toString()));
                              },
                              child: Text(
                                "Resend",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
