import 'package:finalapppp/ui/google_login/signin.dart';
import 'package:flutter/material.dart';
import '../../../resources/constants/font_weight.dart';
import '../../../widgets/component/text_widget.dart';
import '../../resources/constants/constants.dart';
import '../login_intro/login_intro.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      Navigator.of(context).pushNamed(LoginIntro.routeName);
      // Navigator.of(context).pushNamed(SignInScreen.routeName);
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextWidget(title: Constants.appName,
        fontWeight: AppFontWeight.bold,),
      ),
    );
  }
}
