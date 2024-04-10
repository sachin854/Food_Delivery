import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../resources/assets/images.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import 'base.dart';

class RestApiClientService extends RestApiBaseService {
  static RestApiClientService shared = RestApiClientService._internal();
  RestApiClientService._internal() : super();
  List searchData = [
    {
      "img":
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
      "restaurant": "Boda Sheera",
      "kms": "2 kms",
      "rating": "4.8 (1.2k)",
      "food_price": "\$8.00",
      "items": [
        {
          "title": "Special Dessert with Strwaberry",
          "price": "\$10",
          "img":
              "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
        },
        {
          "title": "Special Dessert with Strwaberry",
          "price": "\$10",
          "img":
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
        }
      ],
    },
    {
      "img":
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
      "restaurant": "Boda Sheera",
      "kms": "2 kms",
      "rating": "4.8 (1.2k)",
      "food_price": "\$8.00",
      "items": [
        {
          "title": "Special Dessert with Strwaberry",
          "price": "\$10",
          "img":
              "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
        },
      ],
    }
  ];
  List data = [
    {
      "food_title": "Burger1",
      "delivery_charges": "\$10.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": false,
      "images":
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
      "your_title": "1x mixed vegitable salad",
      "menu_title": "Special bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 50.00,
      "isTapped": false,
      "description":
          "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",

    },
    {
      "food_title": "Burger2",
      "delivery_charges": "\$11.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": false,
      "images":"https://www.acouplecooks.com/wp-content/uploads/2019/05/Chopped-Salad-001_1.jpg",
      "your_title": "Hamburger",
      "menu_title": "HHSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 30.00,
      "isTapped": false,
      "description":
          "This burger is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },
    {
      "food_title": "Burger 3",
      "delivery_charges": "\$51.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": false,
      "images":
          "https://www.freepnglogos.com/uploads/food-png/food-png-transparent-images-png-only-6.png",
      "your_title": "1x mixed vegitable salad",
      "menu_title": "KKSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 20.00,
      "isTapped": false,
      "description":
          "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },
    {
      "food_title": "Burger 4",
      "delivery_charges": "\$51.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": false,
      "images":
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
      "your_title": "1x mixed vegitable salad",
      "menu_title": "JJSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 10.00,
      "isTapped": false,
      "description":
          "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },
    {
      "food_title": "Pizza ",
      "delivery_charges": "\$51.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": false,
      "images":
      "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
      "your_title": "1x mixed vegitable salad",
      "menu_title": "JJSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 10.00,
      "description":
      "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },

  ];

  List discountArray = [
    {
      "id": "Humbarg",
      "food_title": "Burger 1",
      "delivery_charges": "\$10.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": true,
      "images":"https://www.realsimple.com/thmb/z3cQCYXTyDQS9ddsqqlTVE8fnpc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/real-simple-mushroom-black-bean-burgers-recipe-0c365277d4294e6db2daa3353d6ff605.jpg",
      "your_title": "1x mixed vegitable salad",
      "menu_title": "Special bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 50.00,
      "description":
      "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },
    {
      "id": "Humbarg",
      "food_title": "Burger 2",
      "delivery_charges": "\$51.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": false,
      "images":"https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww&w=1000&q=80",
      "your_title": "1x mixed vegitable salad",
      "menu_title": "KKSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 20.00,
      "description":
      "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },
    {
      "id": "Humbarg",
      "food_title": "Burger 3",
      "delivery_charges": "\$11.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": true,
      "images":"https://assets.cntraveller.in/photos/60ba26c0bfe773a828a47146/16:9/w_1920,h_1080,c_limit/Burgers-Mumbai-Delivery.jpg",
      "your_title": "Hamburger",
      "menu_title": "HHSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 30.00,
      "description":
      "This burger is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },
    {
      "id": "Humbarg",
      "food_title": "Burger 4",
      "delivery_charges": "\$51.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": true,
      "images":"https://assets.cntraveller.in/photos/6246f468c579dd6f2d1244b6/4:3/w_2120,h_1590,c_limit/Best%20Burgers%20in%20Mumbai%20_Louis%20Monstercheese%20Burger.jpg","your_title": "1x mixed vegitable salad",
      "menu_title": "JJSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 10.00,
      "description":
      "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },
    {
      "id": "Humbarg",
      "food_title": "Burger 5",
      "delivery_charges": "\$51.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": false,
      "images":
      "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
      "your_title": "1x mixed vegitable salad",
      "menu_title": "JJSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 10.00,
      "description":
      "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },
    {"id": "Pizza",
      "food_title": "Pizza",
      "delivery_charges": "\$51.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": false,
      "images":
      "https://img.freepik.com/free-photo/top-view-pepperoni-pizza-with-mushroom-sausages-bell-pepper-olive-corn-black-wooden_141793-2158.jpg?w=2000",
      "your_title": "1x mixed vegitable salad",
      "menu_title": "JJSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 10.00,
      "description":
      "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },
    {"id": "Noodles",
      "food_title": "Noodles",
      "delivery_charges": "\$51.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": false,
      "images":"https://www.chewoutloud.com/wp-content/uploads/2021/05/lo-mein-square-500x500.jpg",
      "your_title": "1x mixed vegitable salad",
      "menu_title": "JJSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 10.00,
      "description":
      "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },
    {"id": "Noodles",
      "food_title": "Noodles",
      "delivery_charges": "\$51.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": true,
      "images":"https://www.chewoutloud.com/wp-content/uploads/2021/05/lo-mein-square-500x500.jpg",
      "your_title": "1x mixed vegitable salad",
      "menu_title": "JJSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 10.00,
      "description":
      "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },
    {"id": "Meat",
      "food_title": "Meat",
      "delivery_charges": "\$51.00",
      "distance": "1.5 km",
      "ratings": "4.8 (1.2k)",
      "like": false,
      "images":"https://hips.hearstapps.com/hmg-prod/images/peach-balsamic-grilled-chicken-5-1662057070.jpg",
      "your_title": "1x mixed vegitable salad",
      "menu_title": "JJSpecial bound salad",
      "drink_title": "1x Fresh Avacado juice",
      "price": 10.00,
      "description":
      "This vegitable salad is tasty and delesious summer salad made with fresh raw veggies.avacado,nuts and its is good for health",
    },

  ];
  List<dynamic> getHomeItemData() {
    return discountArray;
  }
  List payment = [
    {
      "icon": const Icon(
        Icons.wallet,
        color: AppColor.greenColor,
      ),
      "title": "My Wallet",
      "price": "\$9.00",
    },{
      "icon": const Icon(
        Icons.paypal,color:AppColor.secondaryColor,
      ),
      "title": "PayPal",
      "price": "\$9.00",
    },{
      "icon":  const Icon(
        Icons.g_mobiledata_rounded,
        color:  AppColor.greenColor,
      ),
      "title": "Google Pay",
      "price": "\$9.00",
    },{
      "icon": const Icon(
        Icons.apple,
      ),
      "title": "Apple Pay",
      "price": "\$9.00",
    },{
      "icon": const Icon(
        Icons.price_change,color:  AppColor.greenColor,
      ),
      "title": "Cash Money",
      "price": "\$9.00",
    },{
      "icon": const Icon(
        Icons.credit_card,color:  AppColor.orangeColor,
      ),
      "title": "**** **** **** 4679",
      "price": "\$9.00",
    },
  ];

  List discount=[
    {
      "icon": const Icon(
        Icons.wallet,
        color: AppColor.greenColor,
      ),
      "title": "New User Promo",
      "details": "only valid for new user",
    },{
      "icon":const Icon(
        Icons.wallet,
        color: AppColor.greenColor,
      ),
      "title": "Discount 20% OFF",
      "details": "20% discount on all menus",
    },{
      "icon": const Icon(
        Icons.wallet,
        color: AppColor.greenColor,
      ),
      "title": "Free Delivery Fee",
      "details": "Free delivery max \$4.00",
    },{
      "icon": const Icon(
        Icons.wallet,
        color: AppColor.greenColor,
      ),
      "title": "Weekend Special",
      "details": "Valid on Saturday & Sunday",
    },{
      "icon": const Icon(
        Icons.wallet,
        color: AppColor.greenColor,
      ),
      "title": "Year End Promo",
      "details": "Christmas & new year promo",
    },
  ];
  Map<String, dynamic> additemdata(String id) {
    List description = data;
    return description[int.parse(id)];
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  List<dynamic> deliveryaddress = [
    {
      "title": "Home",
      "defaultbutton": true,
      "address": "Times Square New",
      "radioenable": true
    },
    {
      "title": "My Office",
      "defaultbutton": false,
      "address": "Times Square New",
      "radioenable": true
    },
    {
      "title": "My Apartment",
      "defaultbutton": false,
      "address": "Times Square New",
      "radioenable": true
    },
    {
      "title": "Parents House",
      "defaultbutton": false,
      "address": "Times Square New",
      "radioenable": true
    },
    {
      "title": "My Villa",
      "defaultbutton": false,
      "address": "Times Square New",
      "radioenable": true
    },
  ];
  List checkoutOrderSummary = [
    {
      "img":
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
      "title": "Mixed Bowl Salad",
      "price": 18.00
    },
    {
      "img":
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
      "title": "Mixed Bowl Salad",
      "price": 18.00
    },
    {
      "img":
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
      "title": "Mixed Bowl Salad",
      "price": 18.00
    },
  ];

  Future<void> verifyPhone({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future loginData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulating delay
    var userData = {
      '_id': 'user123',
      'userID': 'ddddd',
    };
    return userData;
  }

  List<dynamic> getOffersData() {
    List data = [
      {
        "percentage": "30%",
        "discountText": "DISCOUNT ONLY",
        "validText": "VALID FOR TODAY",
      },
      {
        "percentage": "15%",
        "discountText": "DISCOUNT ONLY",
        "validText": "VALID FOR TODAY",
      },
      {
        "percentage": "20%",
        "discountText": "DISCOUNT ONLY",
        "validText": "VALID FOR TODAY",
      },
      {
        "percentage": "25%",
        "discountText": "DISCOUNT ONLY",
        "validText": "VALID FOR TODAY",
      },
    ];
    List offersData = data;
    return offersData;
  }

  List<dynamic> getRecommendFilterData() {
    List data = [
      {"food_image": Images.check, "title": "All"},
      {"food_image": Images.burger, "title": "Hamburger"},
      {"food_image": Images.pizza, "title": "Pizza"},
      {"food_image": Images.dessert, "title": "Icecreams"},
      {"food_image": Images.vegetables, "title": "Drinks"}
    ];
    List recommendFilterData = data;
    return recommendFilterData;
  }

  List<dynamic> getRecommendMenuData() {
    List data = [
      {
        "food_filter": "All",
        "food_image": Images.burger,
        "food_title": "Vegitarian Noodles",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
      },
      {
        "food_filter": "HamBurger",
        "food_image": Images.burger,
        "food_title": "Pizza Hut- Lumintu",
        "distance": "800 m",
        "rating": "1.3 (2.3k)",
        "food_price": "\$1.60",
      },
      {
        "food_filter": "Pizza",
        "food_image": Images.burger,
        "food_title": "Mozerella Cheese Burger",
        "distance": "800 m",
        "rating": "4.9 (3.1k)",
        "food_price": "\$3.00",
      },
      {
        "food_filter": "IceCream",
        "food_image": Images.burger,
        "food_title": "Fruit salad -Kumpa",
        "distance": "800 m",
        "rating": "4.9 (2.3k)",
        "food_price": "\$7.00",
      },
      {
        "food_filter": "Drinks",
        "food_image": Images.burger,
        "food_title": "Pizza Hut- Lumintu",
        "distance": "800 m",
        "rating": "4.9 (2.3k)",
        "food_price": "\$4.20",
      },
      {
        "food_filter": "Dessert",
        "food_image": Images.burger,
        "food_title": "Pizza Hut- Lumintu",
        "distance": "800 m",
        "rating": "1.3 (2.3k)",
        "food_price": "\$1.60",
      },
    ];
    List recommendMenuData = data;
    return recommendMenuData;
  }

  List<dynamic> getFilterdata() {
    List data = [
      {
        "food_filter": "Filter",
        "food_title": "Vegitarian Noodles",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
      },
      {
        "food_filter": "Sort",
        "food_title": "Pizza Hut- Lumintu",
        "distance": "800 m",
        "rating": "1.3 (2.3k)",
        "food_price": "\$1.60",
      },
      {
        "food_filter": "Promo",
        "food_title": "Mozerella Cheese Burger",
        "distance": "800 m",
        "rating": "4.9 (3.1k)",
        "food_price": "\$3.00",
      },
      {
        "food_filter": "Self Pick",
        "food_title": "Fruit salad -Kumpa",
        "distance": "800 m",
        "rating": "4.9 (2.3k)",
        "food_price": "\$7.00",
      },
    ];
    List filterdata = data;
    return filterdata;
  }


  Future signUpPressed(
      {required String number,
      required String email,
      required String fullname}) async {
    // try {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    user = await auth.currentUser;
    final uid = user?.uid;
    // print("uiddddduiddddd" + uid!);
    DatabaseReference userRef =
        FirebaseDatabase.instance.reference().child('users');
    await userRef.child(user?.uid ?? "").set({
      'phoneNo': number,
      'email': email,
      'fullName': fullname,
      'uid': uid,
    });
    // } catch (ex) {
    //   print('Something went wrong');
    // }
  }

  List<dynamic> getNotificationData() {
    List data = [
      {
        "avatar": CircleAvatar(
            backgroundColor: AppColor.redColor.withOpacity(0.1),
            radius: 25,
            child: Container(
              height: Dimensions.dimen20,
              width: Dimensions.dimen20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.redColor.withOpacity(0.7)),
              child: const Icon(
                Icons.close,
                color: AppColor.whiteColor,
                size: 15,
              ),
            )),
        "title": "Orders Cancelled!",
        "date": "19 Dec. 2022",
        "time": "20:50 PM",
        "description":
            "You have cancelled an oreder at Burger Hut.We apologize for your inconvenience.We will try to improve our service next time.",
        "buttonshow": true
      },
      {
        "avatar": CircleAvatar(
            backgroundColor: AppColor.greenColor.withOpacity(0.1),
            radius: 25,
            child: const Icon(
              Icons.shopping_bag,
              color: AppColor.greenColor,
              size: 25,
            )),
        "title": "Orders Successful!",
        "date": "19 Dec. 2022",
        "time": "20:50 PM",
        "description":
            "You have cancelled an oreder at Burger Hut and paid \$24.Your food will arrive soon.Enjoy our services.",
        "buttonshow": true
      },
      {
        "avatar": CircleAvatar(
            backgroundColor: AppColor.lemonYellow.withOpacity(0.1),
            radius: 25,
            child: const Icon(
              Icons.stars,
              color: AppColor.lemonYellow,
              size: 25,
            )),
        "title": "New Services Available!",
        "date": "14 Dec. 2022",
        "time": "10:50 AM",
        "description":
            "You can now make multiple food orders at one time.You can also cancel your orders.",
        "buttonshow": false
      },
      {
        "avatar": CircleAvatar(
            backgroundColor: AppColor.blueColor,
            radius: 25,
            child: Icon(
              Icons.credit_card,
              color: AppColor.blueColor.withOpacity(1.0),
              size: 25,
            )),
        "title": "Credit Card Connected!",
        "date": "14 Dec. 2022",
        "time": "15:38 PM",
        "description":
            "Your credit card has been successfully linked with Foodu.Enjoy our services.",
        "buttonshow": false
      },
      {
        "avatar": CircleAvatar(
            backgroundColor: AppColor.greenColor.withOpacity(0.1),
            radius: 25,
            child: const Icon(
              Icons.person,
              color: AppColor.greenColor,
              size: 25,
            )),
        "title": "Account Setup Successfull!",
        "date": "14 Dec. 2022",
        "time": "15:38 PM",
        "description":
            "Your account creation is successfull,you can now experience our services.",
        "buttonshow": false
      },
    ];
    List notificationdata = data;
    return notificationdata;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
        print("user" + user.toString());
      } catch (e) {
        print("erorrrr" + e.toString());
      }
    }
    else {

      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
          print("Userrrr: ${user?.displayName.toString()}");
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // ...
          } else if (e.code == 'invalid-credential') {
            // ...
          }
        } catch (e) {
          // ...
        }
      }

    }

    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          "Error signing out. Try again.",
          style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
        ),
      ));
    }
  }

  List<dynamic> getCartData() {
    List cardData = [
      {
        "images": [
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
        ],
        "title": "Mixed Salad Bowl",
        "itemCount": "1 items",
        "kms": "1.5 kms",
        "price": "\$ 60.00"
      },
      {
        "images": [
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
          "https://www.freepnglogos.com/uploads/food-png/food-png-transparent-images-png-only-6.png"
        ],
        "title": "Mixed Salad Bowl",
        "itemCount": "2 items",
        "kms": "1.5 kms",
        "price": "\$ 60.00"
      },
      {
        "images": [
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
          "https://www.freepnglogos.com/uploads/food-png/food-png-transparent-images-png-only-6.png"
        ],
        "title": "Mixed Salad Bowl",
        "itemCount": "2 items",
        "kms": "1.5 kms",
        "price": "\$ 60.00"
      },
      {
        "images": [
          "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
          "https://www.freepnglogos.com/uploads/food-png/food-png-transparent-images-png-only-6.png",
          "https://www.freepnglogos.com/uploads/food-png/fast-food-transparent-png-pictures-icons-and-png-18.png"
        ],
        "title": "Mixed Salad Bowl",
        "itemCount": "2 items",
        "kms": "1.5 kms",
        "price": "\$ 60.00"
      },
    ];
    List cartData = cardData;
    return cartData;
  }

  List<dynamic> getRecentSearchData() {
    List recentSearchData = [
      'Italian Pizza',
      'Burger King',
      'Salad',
      'Vegetarian',
      'Dessert',
      'Pancakes',
    ];
    return recentSearchData;
  }

  List<dynamic> getPopularCuisines() {
    List popularCuisines = [
      'Breakfast',
      'Snack',
      'Fast Food',
      'Beverages',
      'Chicken',
      'Noodles',
      'Rice',
      'Seafood',
      'International',
    ];
    return popularCuisines;
  }

  List<dynamic> getAllCuisines() {
    List allCuisines = ['Bakery & Cake', 'Dessert', 'Pizza'];
    return allCuisines;
  }

  List<dynamic> getAllAddress() {
    List deliveryaddress = [
      {
        "title": "Home",
        "defaultbutton": true,
        "address": "Times Square New",
        "radioenable": true
      },
      {
        "title": "My Office",
        "defaultbutton": false,
        "address": "Times Square New",
        "radioenable": true
      },
      {
        "title": "My Apartment",
        "defaultbutton": false,
        "address": "Times Square New",
        "radioenable": true
      },
      {
        "title": "Parents House",
        "defaultbutton": false,
        "address": "Times Square New",
        "radioenable": true
      },
      {
        "title": "My Villa",
        "defaultbutton": false,
        "address": "Times Square New",
        "radioenable": true
      },
    ];
    return deliveryaddress;
  }

  ///Home Page
  Future getUser() async {
    User? user;
    try {
      user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        print("User Details hh: ${user.toString()}");
        return user;
      }
    } catch (e) {
      print('Error during userCheck(): $e');
    }
  }

  List<dynamic> getUserDetails() {
    List userData = [
      {
        "profile":
            "https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg",
        "address": "Times Square",
      },
    ];
    return userData;
  }

  // List<dynamic> getDicountData() {
  //   List discountArray = [
  //     {
  //       "food_image": Images.burger,
  //       "food_title": "Shwetha Puri",
  //       "distance": "1.5 km",
  //       "ratings": "4.8 (1.2k)",
  //       "food_price": "\$6.00",
  //       "delivery_charges": "\$21.00",
  //       "like": false,
  //     },
  //     {
  //       "food_image": Images.burger,
  //       "food_title": "Udupi Shwetha chorepat",
  //       "distance": "2.0 km",
  //       "ratings": "4.8 (1.2k)",
  //       "food_price": "\$20.00",
  //       "delivery_charges": "\$5.00",
  //       "like": false,
  //     },
  //     {
  //       "food_image": Images.burger,
  //       "food_title": "Mixed Salad BambooooBambooooBamboooo",
  //       "distance": "1.5 km",
  //       "ratings": "4.8 (1.2k)",
  //       "food_price": "\$60.00",
  //       "delivery_charges": "\$20.00",
  //       "like": false,
  //     },
  //   ];
  //
  //   return discountArray;
  // }

  List<dynamic> getcategoryData() {
    List category = [
      {
        "food_image": Images.burger,
        "category_name": "Humbarg",
      },
      {
        "food_image": Images.pizza,
        "category_name": "Pizza",
      },
      {
        "food_image": Images.noodles,
        "category_name": "Noodles",
      },
      {
        "food_image": Images.meat,
        "category_name": "Meat",
      },
      {
        "food_image": Images.vegetables,
        "category_name": "Vegetables",
      },
      {
        "food_image": Images.dessert,
        "category_name": "Dessert",
      },
      {
        "food_image": Images.drink,
        "category_name": "Drink",
      },
      {
        "food_image": Images.more,
        "category_name": "More",
      },
    ];
    return category;
  }


  List<dynamic> sortOptions(){
    List<Map<String, dynamic>> sortOptions=[
      {
        "food_filter": "Filter",
      },{
        "food_filter": "Sort",
      },{

    "food_filter": "Promo",
      },{
        "food_filter": "Selft Pick",
      },
    ];
    return sortOptions;
  }

  ///Old File
  List<dynamic> getFilteredData(String selectedCategoryName,) {
    List<Map<String, dynamic>> categoryData = [
      {
        "id": "Humbarg",
        "food_filter": "Filter",
        "food_image": Images.burger,
        "food_title": "Humbarg",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Humbarg",
      },
      {
        "id": "Humbarg",
        "food_filter": "Sort",
        "food_image": Images.burger,
        "food_title": "Humbarg item",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Humbarg",
      },
      {
        "id": "Humbarg",
        "food_filter": "Promo",
        "food_image": Images.burger,
        "food_title": "Humbarg",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Humbarg",
      },
      {
        "id": "Humbarg",
        "food_filter": "Self Pick",
        "food_image": Images.burger,
        "food_title": "Humbarg ",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Humbarg",
      },
      {
        "id": "Pizza",
        "food_filter": "Self Pick",
        "food_image": Images.burger,
        "food_title": "Pizza a",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Pizza",
      },
      {
        "id": "Pizza",
        "food_image": Images.burger,
        "food_title": "Pizza 2",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Pizza",
      },
      {
        "id": "Pizza",
        "food_image": Images.burger,
        "food_title": "Pizza 3",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Pizza",
      },
      {
        "id": "Noodles",
        "food_image": Images.burger,
        "food_title": "Noodles 1",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Pizza",
      },
      {
        "id": "Noodles",
        "food_image": Images.burger,
        "food_title": "Noodles 2",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Pizza",
      },
      {
        "id": "Meat",
        "food_image": Images.burger,
        "food_title": "Meat 1",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Pizza",
      },
      {
        "id": "Meat",
        "food_image": Images.burger,
        "food_title": "Meat2",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Pizza",
      },
      {
        "id": "Vegetables",
        "food_image": Images.burger,
        "food_title": "Vegitarian Noodles",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Pizza",
      },
      {
        "id": "Dessert",
        "food_image": Images.burger,
        "food_title": "Vegitarian Noodles",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Pizza",
      },
      {
        "id": "Drink",
        "food_image": Images.burger,
        "food_title": "Vegitarian Noodles",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
        "category_name": "Pizza",
      },
    ];
    List<Map<String, dynamic>> filteredData = categoryData
        .where((item) => item["id"] == selectedCategoryName)
        .toList();
    return filteredData;
  }
}
