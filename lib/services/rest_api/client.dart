import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../resources/assets/images.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import 'base.dart';

class RestApiClientService extends RestApiBaseService {
  static RestApiClientService shared = RestApiClientService._internal();
  RestApiClientService._internal() : super();

  FirebaseAuth auth = FirebaseAuth.instance;
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
    await Future.delayed(Duration(seconds: 2)); // Simulating delay
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


  List<dynamic> getRecommendMenuData() {
    List data = [
      {
        "food_filter":"All",
        "food_title": "Vegitarian Noodles",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
      },
      {
        "food_filter":"HamBurger",
        "food_title": "Pizza Hut- Lumintu",
        "distance": "800 m",
        "rating": "1.3 (2.3k)",
        "food_price": "\$1.60",
      },
      {
        "food_filter":"Pizza",
        "food_title": "Mozerella Cheese Burger",
        "distance": "800 m",
        "rating": "4.9 (3.1k)",
        "food_price": "\$3.00",
      },
      {
        "food_filter":"IceCream",
        "food_title": "Fruit salad -Kumpa",
        "distance": "800 m",
        "rating": "4.9 (2.3k)",
        "food_price": "\$7.00",
      },
      {
        "food_filter":"Drinks",
        "food_title": "Pizza Hut- Lumintu",
        "distance": "800 m",
        "rating": "4.9 (2.3k)",
        "food_price": "\$4.20",
      },
      {
        "food_filter":"Dessert",
        "food_title": "Pizza Hut- Lumintu",
        "distance": "800 m",
        "rating": "1.3 (2.3k)",
        "food_price": "\$1.60",
      },
    ];
    List recommendMenuData = data;
    return recommendMenuData;
  }

  List<dynamic> getFilterdata(){
    List data = [
      {
        "food_filter":"Filter",
        "food_title": "Vegitarian Noodles",
        "distance": "800 m",
        "rating": "4.8 (1.2k)",
        "food_price": "\$8.00",
      },
      {
        "food_filter":"Sort",
        "food_title": "Pizza Hut- Lumintu",
        "distance": "800 m",
        "rating": "1.3 (2.3k)",
        "food_price": "\$1.60",
      },
      {
        "food_filter":"Promo",
        "food_title": "Mozerella Cheese Burger",
        "distance": "800 m",
        "rating": "4.9 (3.1k)",
        "food_price": "\$3.00",
      },
      {
        "food_filter":"Self Pick",
        "food_title": "Fruit salad -Kumpa",
        "distance": "800 m",
        "rating": "4.9 (2.3k)",
        "food_price": "\$7.00",
      },
    ];
    List filterdata=data;
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
    } else {
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
  List<dynamic> getCartData(){
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
  List<dynamic> getRecentSearchData(){
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
  List<dynamic> getPopularCuisines(){
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
  List<dynamic> getAllCuisines(){
    List allCuisines = ['Bakery & Cake', 'Dessert', 'Pizza'];
    return allCuisines;
  }
}
