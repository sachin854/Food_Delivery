import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'base.dart';

class RestApiClientService extends RestApiBaseService {
  static RestApiClientService shared = RestApiClientService._internal();
  RestApiClientService._internal() : super();

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

  List<dynamic> getNotificationData(){
    List data = [
      {
        "title": "Orders Cancelled!",
        "date": "19 Dec. 2022",
        "time": "20:50 PM",
        "description":
        "You have cancelled an oreder at Burger Hut.We apologize for your inconvenience.We will try to improve our service next time.",
        "buttonshow":true
      },
      {
        "title": "Orders Successful!",
        "date": "19 Dec. 2022",
        "time": "20:50 PM",
        "description":
        "You have cancelled an oreder at Burger Hut and paid \$24.Your food will arrive soon.Enjoy our services.",
        "buttonshow":true
      },
      {
        "title": "New Services Available!",
        "date": "14 Dec. 2022",
        "time": "10:50 AM",
        "description":"You can now make multiple food orders at one time.You can also cancel your orders.",
        "buttonshow":false
      },
      {
        "title": "Credit Card Connected!",
        "date": "14 Dec. 2022",
        "time": "15:38 PM",
        "description":"Your credit card has been successfully linked with Foodu.Enjoy our services.",
        "buttonshow":false
      },
      {
        "title": "Account Setup Successfull!",
        "date": "14 Dec. 2022",
        "time": "15:38 PM",
        "description":"Your account creation is successfull,you can now experience our services.",
        "buttonshow":false
      },
    ];
    List notificationdata=data;
    return notificationdata;
  }

}
