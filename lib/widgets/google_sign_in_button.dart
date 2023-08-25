import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets/images.dart';
import '../resources/constants/color.dart';
import '../resources/constants/dimensions.dart';
import 'component/text_widget.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
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
              Images.googleBlackLogo,
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
