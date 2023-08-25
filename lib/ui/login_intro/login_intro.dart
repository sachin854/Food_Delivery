import 'package:flutter/material.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../widgets/component/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/assets/images.dart';
import '../../widgets/google_sign_in_button.dart';

class LoginIntro extends StatefulWidget {
  static const routeName = "/loginIntro";
  const LoginIntro({super.key});

  @override
  State<LoginIntro> createState() => _LoginIntroState();
}

class _LoginIntroState extends State<LoginIntro> {
  var img=[Images.facebookLogo,Images.googleBlackLogo,Images.appleLogo];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.primaryColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
            leading: const BackButton(
              color: Colors.black,
            ),
          ),
          body: Column(
            children: [
              Center(
                child: SvgPicture.asset(
                  Images.loginIntro,
                  height: Dimensions.dimen233,
                  width: Dimensions.dimen233,
                ),
              ),
              const TextWidget(
                title: "Let's you in",
                titleColor: AppColor.blackColor,
                fontSize: Dimensions.dimen40,
                fontWeight: FontWeight.bold,
                padding: EdgeInsets.only(top: Dimensions.dimen20),
              ),
              const Spacer(),

              for(int i=0;i<img.length;i++)
                 GoogleSignInButton(imgName:img[i]),

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
                          thickness: 1,
                        )),
                  ],
                ),
              ),

              SizedBox(width: MediaQuery.of(context).size.width*0.9,height: Dimensions.dimen45,
                child: ElevatedButton(
                    style:  ElevatedButton.styleFrom(
                      foregroundColor: AppColor.whiteColor, backgroundColor: AppColor.blackColor, // Set the button's text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36), // Set the corner radius here
                      ),
                    ),
                    onPressed: () {},
                    child: const TextWidget(
                      title: "Sign in with Phone Number",
                    )),
              ),
              const SizedBox(
                height: Dimensions.dimen20,
              )
            ],
          ),
        ));
  }
}
