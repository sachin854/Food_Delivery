import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../controller/bloc/auth_sign_in/auth_bloc.dart';
import '../../controller/bloc/auth_sign_in/auth_event.dart';
import '../../controller/bloc/signup/signup_event.dart';
import '../../controller/bloc/signup/signup_state.dart';
import '../../resources/assets/images.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../resources/constants/font_weight.dart';
import '../../resources/constants/padding.dart';
import '../../controller/bloc/signup/signup_bloc.dart';
import '../../widgets/component/text_widget.dart';
import '../../widgets/social_sign_in_button.dart';

class SignUp extends StatefulWidget {
  static const routeName = "/signUp";
   SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpBloc? _signUpBloc;
  late AuthBloc _authBloc;
  TextEditingController? _phoneNoController;
  TextEditingController? _emailController;
  TextEditingController? _fullNameController;
  CountryCode _countryCode = CountryCode(code: 'IN', dialCode: '+91');
  bool isFocus = false;
  bool isRemember = false;
  void focus() {
    setState(() {
      isFocus = true;

    });
  }

  @override
  void initState() {
    _signUpBloc = BlocProvider.of<SignUpBloc>(context);
    _phoneNoController = TextEditingController();
    _emailController = TextEditingController();
    _fullNameController = TextEditingController();
    _authBloc = AuthBloc();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _phoneNoController!.dispose();
    _emailController!.dispose();
    _fullNameController!.dispose();
    _signUpBloc!.close();
    _authBloc.close();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
          leading: const BackButton(
            color: AppColor.blackColor,
          ),
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<SignUpBloc, SignUpState>(
              listener: (context, state) {},
              builder: (context, state) {
                print("knitting$state");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Image.network(
                            "https://img.freepik.com/free-vector/image-upload-concept-illustration_114360-996.jpg?size=626&ext=jpg"),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Create New Account",
                        style: TextStyle(
                            fontSize: AppFontWeight.font22,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.dimen15,
                    ),
                    Form(
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: Paddings.padding16,
                            right: Paddings.padding16),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    // isFocus
                                    //     ? Colors.green :
                                    Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                //onTap: focus,
                                onChanged: (val) {
                                  _signUpBloc!.setName(context, val);
                                },
                                keyboardType: TextInputType.phone,
                                controller: _phoneNoController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone no",
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  prefixIcon: CountryCodePicker(
                                    //padding: const EdgeInsets.only(top: 15),
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
                                    return "Please enter valid no"; //'Please enter valid phone number';
                                  }
                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.disabled,
                              ),
                            ),
                            const SizedBox(
                              height: Dimensions.dimen20,
                            ),
                            Container(
                              height: Dimensions.dimen56,
                              padding: const EdgeInsets.all(Paddings.padding12),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                // onTap: focus,
                                onChanged: (val) {
                                  _signUpBloc!.setEmail(context, val);
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,

                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle:
                                      TextStyle(color: AppColor.greyColor),
                                  prefixIcon: Icon(Icons.email),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: Dimensions.dimen20,
                            ),
                            Container(
                              height: Dimensions.dimen56,
                              padding: const EdgeInsets.all(Paddings.padding10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                //onTap: focus,
                                onChanged: (val) {
                                  _signUpBloc!.setName(context, val);
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: _fullNameController,
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  hintText: "FullName",
                                  hintStyle:
                                      TextStyle(color: AppColor.greyColor),
                                  prefixIcon: Icon(Icons.lock),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: Dimensions.dimen10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                          width: 2, color: Colors.green),
                                    ),
                                    activeColor: Colors.green.withOpacity(1.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    value: isRemember,
                                    onChanged: (newValue) {
                                      setState(() {
                                        isRemember = newValue!;
                                      });
                                    }),
                                const Text(
                                  "Remember Me",
                                  style: TextStyle(
                                      fontSize: AppFontWeight.font12,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: Dimensions.dimen10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width ,
                              height: Dimensions.dimen50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: AppColor.whiteColor,
                                    backgroundColor:
                                    AppColor.greenColor, // Set the button's text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(36), // Set the corner radius here
                                    ),
                                  ),
                                  onPressed: () {
                                    signUpPressed(context);
                                  },
                                  child: const TextWidget(
                                    title: "Sign up",   fontWeight: FontWeight.bold,fontSize: AppFontWeight.font16,
                                  )),
                            ),
                            // Container(
                            //     height: Dimensions.dimen50,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10)),
                            //     width: MediaQuery.of(context).size.width,
                            //     child: ElevatedButton(
                            //         style: ElevatedButton.styleFrom(
                            //             backgroundColor: AppColor.greenColor),
                            //         onPressed: () {
                            //           print("submit$state");
                            //           signUpPressed(context);
                            //         },
                            //         child: const Text(
                            //           "Sign Up",
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               fontSize: 16,
                            //               color: Colors.white),
                            //         ))),
                            const SizedBox(
                              height: Dimensions.dimen25,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    indent: 15,
                                    endIndent: 10,
                                    color: Colors.grey.withOpacity(0.4),
                                  ),
                                ),
                                const Text(
                                  "or continue with",
                                  style: TextStyle(
                                      fontSize: AppFontWeight.font14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey),
                                ),
                                Expanded(
                                  child: Divider(
                                      indent: 15,
                                      endIndent: 10,
                                      color: Colors.grey.withOpacity(0.4)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: Dimensions.dimen20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                                  height: Dimensions.dimen50,
                                  width: Dimensions.dimen70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.1),
                                      border: Border.all(
                                          color: AppColor.greyColor.withOpacity(0.2))),
                                  child: SvgPicture.asset(
                                    Images.facebookColoredLogo,
                                  ),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    _authBloc.add(GoogleSignInTapEvent(context));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                                    height: Dimensions.dimen50,
                                    width: Dimensions.dimen70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white.withOpacity(0.1),
                                        border: Border.all(
                                            color: AppColor.greyColor.withOpacity(0.2))),
                                    child: SvgPicture.asset(
                                      Images.googleColoredLogo,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                  height: Dimensions.dimen50,
                                  width: Dimensions.dimen70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.1),
                                      border: Border.all(
                                          color: AppColor.greyColor.withOpacity(0.2))),
                                  child:  SvgPicture.asset(
                                    Images.appleLogo,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: Dimensions.dimen20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: const TextWidget(
                                      title: "Already have an account? ",titleColor: AppColor.greyColor,fontSize: 16,
                                    )),
                                InkWell(
                                  onTap: () {
                                    //Navigator.pushNamed(context, LoginScreen.routename);
                                  },
                                  child: const TextWidget(
                                    title: "Sign in",
                                    titleColor: AppColor.greenColor,
                                    fontWeight: FontWeight.w600,fontSize: AppFontWeight.font15,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  signUpPressed(BuildContext context) {
    print("c");
    print(_phoneNoController!.text.toString());
    print(_emailController!.text.toString());
    print(_fullNameController!.text.toString());
    _signUpBloc?.add(SignUpSubmitEvent(
        _phoneNoController!.text.toString(),
        _emailController!.text.toString(),
        _fullNameController!.text.toString()));
  }

  // Future<void> signUpPressed() async {
  //   var phoneNo = _phoneNoController.text;
  //   var email = _emailController.text;
  //   var fullName = _fullNameController.text;
  //   try {
  //     final FirebaseAuth auth = FirebaseAuth.instance;
  //      User? user;
  //      user=await auth.currentUser;
  //      final uid=user!.uid;
  //     print("uiddddd"+uid);
  //     DatabaseReference userRef =
  //         FirebaseDatabase.instance.reference().child('users');
  //     await userRef.child(uid).set({
  //       'phoneNo': phoneNo,
  //       'email': email,
  //       'uid': uid,
  //       'fullName': fullName,
  //     });
  //   } catch (ex) {
  //     print('Something went wrong');
  //   }
  // }
}
