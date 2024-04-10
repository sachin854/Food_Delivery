import 'package:finalapppp/ui/recommended/recommended.dart';
import 'package:flutter/material.dart';
import '../../controller/bloc/auth_sign_in/auth_bloc.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../widgets/component/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/assets/images.dart';
import '../../widgets/social_sign_in_button.dart';
import '../authentication/phone_auth.dart';
import '../home_screen/addbasket/homeitem_screen.dart';
import '../sign_up/sign_up.dart';

class LoginIntro extends StatefulWidget {
  static const routeName = "/loginIntro";
  const LoginIntro({super.key});

  @override
  State<LoginIntro> createState() => _LoginIntroState();
}

class _LoginIntroState extends State<LoginIntro> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc();
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
          leading: const BackButton(
            color: Colors.black,
        ),

        ),
      ),
      body: Column(
        children: [
         const SizedBox(height: Dimensions.dimen10,),
          Center(
            child: SvgPicture.asset(
              Images.loginIntro,
              height: Dimensions.dimen233,
              width: Dimensions.dimen233,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: Dimensions.dimen20),
            child: TextWidget(
              title: "Let's you in",
              titleColor: AppColor.blackColor,
              fontSize: Dimensions.dimen40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          SocialSignInButton(
            type: "facebook",
          ),
          SocialSignInButton(
            type: "google",
          ),
          SocialSignInButton(
            type: "apple",
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: Dimensions.dimen20,
              bottom: Dimensions.dimen20,
            ),
            child: Row(
              children: [
                Expanded(
                    child: Divider(
                  thickness: 1,
                  indent: Dimensions.dimen20,
                  endIndent: Dimensions.dimen20,
                )),
                TextWidget(
                  title: "or",
                  fontWeight: FontWeight.w500,
                  fontSize: Dimensions.dimen17,
                  padding: EdgeInsets.only(
                      left: Dimensions.dimen10, right: Dimensions.dimen10),
                ),
                Expanded(
                    child: Divider(
                  endIndent: Dimensions.dimen20,
                  indent: Dimensions.dimen20,
                  thickness: 1,
                )),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: Dimensions.dimen45,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.whiteColor,
                  backgroundColor:
                      AppColor.blackColor, // Set the button's text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        36), // Set the corner radius here
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: const TextWidget(
                  title: "Sign in with Phone Number",
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {},
                  child: const TextWidget(
                    title: "Don't have an account? ",
                    titleColor: AppColor.greyColor,
                    fontSize: 16,
                  )),
              InkWell(
                onTap: () {

                  Navigator.pushNamed(context, SignUp.routeName);
                  },
                child: const TextWidget(
                  title: "Sign Up",
                  titleColor: AppColor.greenColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(
            height: Dimensions.dimen20,
          ),
        ],
      ),
    ));
  }
}
