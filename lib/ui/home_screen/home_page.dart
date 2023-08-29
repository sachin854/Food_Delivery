import 'package:finalapppp/resources/constants/dimensions.dart';
import 'package:finalapppp/ui/login_intro/login_intro.dart';
import 'package:finalapppp/widgets/component/text_widget.dart';
import 'package:finalapppp/widgets/offerbadge.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../resources/assets/images.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/padding.dart';
import '../../widgets/discount_item_card.dart';
import '../../widgets/itemlist.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    try {
      user = FirebaseAuth.instance.currentUser;
      setState(() {});
      if (!mounted) {
        return;
      }
      if (user != null) {
        print("User Details hh: ${user.toString()}");
      } else {
        Navigator.of(context).pushNamed(LoginIntro.routeName);
      }
    } catch (e) {
      print('Error during userCheck(): $e');
    }
  }

  // Route _routeToSignInScreen() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) =>
  //         const LoginIntro(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       var begin = const Offset(-1.0, 0.0);
  //       var end = Offset.zero;
  //       var curve = Curves.ease;
  //       var tween =
  //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //       return SlideTransition(
  //         position: animation.drive(tween),
  //         child: child,
  //       );
  //     },
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   centerTitle: true,
        //   // title: const Text("Food Delivery Home Page"),
        // ),
        body: Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.dimen15,
              right: Dimensions.dimen15,
              top: Dimensions.dimen15,
              bottom: Dimensions.dimen15),
          child: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Image.network(
                          "https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg"),
                    ),
                    const SizedBox(
                      width: Dimensions.dimen15,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          title: "Deliver to",
                          titleColor: AppColor.greyColor,
                        ),
                        SizedBox(
                          height: Dimensions.dimen10,
                        ),
                        Row(
                          children: [
                            TextWidget(
                              title: "Times Square",
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: Dimensions.dimen40,
                          width: Dimensions.dimen40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColor.borderColor,
                              ),
                              borderRadius: BorderRadius.circular(36)),
                          child: const Stack(children: <Widget>[
                            Center(child: Icon(Icons.notifications_active)),
                            Positioned(
                              // draw a red marble
                              top: Dimensions.dimen8,
                              right: Dimensions.dimen8,
                              child: Icon(Icons.brightness_1,
                                  size: Dimensions.dimen8, color: Colors.redAccent),
                            )
                          ]),
                        ),
                        const SizedBox(
                          width: Dimensions.dimen15,
                        ),
                        Container(
                          height: Dimensions.dimen40,
                          width: Dimensions.dimen40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColor.borderColor,
                              ),
                              borderRadius: BorderRadius.circular(36)),
                          child: const Stack(children: <Widget>[
                            Center(
                              child: Icon(Icons.shopping_cart),
                            ),
                            Positioned(
                              // draw a red marble
                              top: Dimensions.dimen8,
                              right: Dimensions.dimen8,
                              child: Icon(Icons.brightness_1,
                                  size: Dimensions.dimen8, color: Colors.redAccent),
                            )
                          ]),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: Dimensions.dimen20),

                Container(
                  height: Dimensions.dimen48,
                  padding: const EdgeInsets.all(Paddings.padding10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    onChanged: (val) {},
                    keyboardType: TextInputType.emailAddress,
                    // controller: ,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      hintText: "What are you craving?",
                      hintStyle: TextStyle(color: AppColor.greyColor),
                      prefixIcon: Icon(
                        Icons.search,
                        size: Dimensions.dimen27,
                      ),
                    ),
                  ),
                ),

                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.dimen20, bottom: Dimensions.dimen20),
                      child: TextWidget(
                        title: "Special Offers",
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.dimen19,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.dimen20, bottom: Dimensions.dimen20),
                      child: TextWidget(
                        title: "See All",
                        titleColor: AppColor.greenColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.dimen15,
                      ),
                    ),
                  ],
                ),

                OfferCard(),
                 ItemList(image: Images.burger),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.dimen20, bottom: Dimensions.dimen20),
                      child: TextWidget(
                        title: "Discount Guaranteed! ",
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.dimen19,
                      ),
                    ),
                    TextWidget(title: '\u{1F44C}',fontSize: 18,),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.dimen20, bottom: Dimensions.dimen20),
                      child: TextWidget(
                        title: "See All",
                        titleColor: AppColor.greenColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.dimen15,
                      ),
                    ),
                  ],
                ),

                DiscountCard()

                // Text(
                //   user?.displayName ?? "",
                //   style: const TextStyle(
                //     color: Colors.black,
                //     fontSize: 26,
                //   ),
                // ),
                // const SizedBox(height: 8.0),
                // Text(
                //   '( ${user?.email} )',
                //   style: const TextStyle(
                //     color: Colors.redAccent,
                //     fontSize: 20,
                //     letterSpacing: 0.5,
                //   ),
                // ),
                // const SizedBox(height: 16.0),
                // ElevatedButton(
                //   style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.all(
                //       Colors.redAccent,
                //     ),
                //     shape: MaterialStateProperty.all(
                //       RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //   ),
                //   onPressed: () async {
                //     await RestApiClientService.signOut(context: context);
                //     Navigator.of(context).pushReplacement(_routeToSignInScreen());
                //   },
                //   child: const Padding(
                //     padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                //     child: Text(
                //       'Sign Out',
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white,
                //         letterSpacing: 2,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
