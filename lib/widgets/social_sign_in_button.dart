import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../controller/bloc/google_sign_in/authentication.dart';
import '../resources/assets/images.dart';
import '../resources/constants/color.dart';
import '../resources/constants/dimensions.dart';
import '../ui/home_screen/home_page.dart';
import 'component/text_widget.dart';

class SocialSignInButton extends StatefulWidget {
  final String type;
  SocialSignInButton({super.key, required this.type,
  });

  @override
  State<SocialSignInButton> createState() => _SocialSignInButtonState();
}

class _SocialSignInButtonState extends State<SocialSignInButton> {

  googleSignIn() async {
    User? user = await Authentication.signInWithGoogle(context: context);
    if (user != null) {
      Navigator.of(context).pushNamed(HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(onTap: () {

        if(widget.type=="google") {
          googleSignIn();
        }

      },
        child: Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          margin: const EdgeInsets.only(
              left: Dimensions.dimen20,
              right: Dimensions.dimen20,
              top: Dimensions.dimen8,
              bottom: Dimensions.dimen8),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.blackColor12),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.type == "google"
                    ? Images.googleBlackLogo
                    : widget.type == "facebook"
                        ? Images.facebookLogo
                        : Images.appleLogo,
                height: 30,
              ),
              const SizedBox(
                width: Dimensions.dimen10,
              ),
              const TextWidget(
                title: "Continue with Google",
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
      );
  }
}
