import 'package:country_code_picker/country_code_picker.dart';
import 'package:finalapppp/controller/bloc/authentication/signIn/signin_bloc.dart';
import 'package:finalapppp/ui/authentication/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../controller/bloc/authentication/signIn/sign_state.dart';
import '../../controller/bloc/authentication/signIn/signin_event.dart';
import '../../resources/assets/images.dart';
import '../../widgets/component/snackbar_widget.dart';
import '../../widgets/component/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/phoneAuth";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CountryCode _countryCode = CountryCode(code: 'IN', dialCode: '+91');
  final GlobalKey<FormState> _phoneNumberFormKey = GlobalKey();
  late TextEditingController _phoneNumberController;
  late String phoneNumberWithCode = "";
  bool valuefirst = false;
  bool _isFocused = false;
  late SignInBloc _signInBloc;

  void _handleTap() {
    setState(() {
      _isFocused = true;
    });
  }

  void _sendOtp({required String phoneNumber, required BuildContext context}) {
    phoneNumberWithCode = "${_countryCode.dialCode}$phoneNumber";
    _signInBloc!.add(SignInSendOtpEvent(phoneNumberWithCode));
    setState(() {
      _phoneNumberController.clear();
    });
  }

  @override
  void initState() {
    _signInBloc = BlocProvider.of<SignInBloc>(context);
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInOnFirebaseOtpSentState) {
            var resObj = {
              "phNo": _phoneNumberController.text.toString(),
              "verificationId": state.verificationId
            };
            Navigator.pushNamed(context, VerifyOtpScreen.routeName,
                arguments: resObj);
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
            onTap: () {},
            child: SafeArea(
                child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                     if (state is! SignInOtpSentSuccessState)
                    Form(
                      key: _phoneNumberFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back)),
                          Image.asset('assets/images/foodLogo.jpg'),
                          Center(
                            child: Text(
                              'Login to Your Account',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40, bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _isFocused
                                    ? Colors.green.withOpacity(0.2)
                                    : Colors.grey.withOpacity(0.1),
                                border: Border.all(
                                    color: _isFocused
                                        ? Colors.green.withOpacity(0.7)
                                        : Colors.grey.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextFormFieldWidget(
                                onTap: _handleTap,
                                keyboardType: TextInputType.phone,
                                textEditingController: _phoneNumberController,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CountryCodePicker(
                                    onChanged: (CountryCode countryCode) {
                                      setState(() {
                                        _countryCode = countryCode;
                                      });
                                    },
                                    initialSelection: 'IN',
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: false,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.length != 10) {
                                    return "Please enter valid number";
                                  }
                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.disabled,
                              ),
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.green,
                                  value: this.valuefirst,
                                  onChanged: (value) {
                                    setState(() {
                                      this.valuefirst = value!;
                                    });
                                  },
                                ),
                                Text('Remember me')
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 30),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                onPressed: () => {
                                      if (_phoneNumberFormKey.currentState!
                                          .validate())
                                        {
                                          _sendOtp(
                                            phoneNumber:
                                                _phoneNumberController.text,
                                            context: context,
                                          ),
                                        },
                                    },
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  height: 5,
                                ),
                              ),
                              Text(
                                'Or continue with',
                                style: TextStyle(fontSize: 16),
                              ),
                              Expanded(
                                child: Divider(
                                  height: 5,
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 40, bottom: 50),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Colors.black45.withOpacity(0.1)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SvgPicture.asset(
                                      Images.facebookLogo,
                                      height: 30,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Colors.black45.withOpacity(0.1)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SvgPicture.asset(
                                      Images.googleLogo,
                                      height: 30,
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Colors.black45.withOpacity(0.1)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SvgPicture.asset(
                                      Images.appleLogo,
                                      height: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                  Text(
                                    'Signup',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
