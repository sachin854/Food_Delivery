import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/assets/images.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../widgets/component/text_widget.dart';
import 'authentication.dart';
import 'userinfoscreen.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      )
          :
      GestureDetector(
        onTap: () async {
          setState(() {
            _isSigningIn = true;
          });

          User? user =
          await Authentication.signInWithGoogle(context: context);

          setState(() {
            _isSigningIn = false;
          });

          if (user != null) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => UserInfoScreen(
                  user: user,
                ),
              ),
            );
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
                Images.googleLogo,
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
      ),
    );
  }
}
