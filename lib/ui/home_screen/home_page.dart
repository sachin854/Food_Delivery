import 'package:finalapppp/services/rest_api/client.dart';
import 'package:finalapppp/ui/login_intro/login_intro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';



class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage({Key? key,}):
        super(key: key);

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

  Future getUser()async {
    try {
      user  = FirebaseAuth.instance.currentUser;
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

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const LoginIntro(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }



  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Food Delivery Home Page"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
                    child: Material(
                      color: Colors.blueGrey.withOpacity(0.3),
                      child: user?.photoURL != null?
                      Image.network(
                        user?.photoURL ?? "",
                        fit: BoxFit.fitHeight,
                      ):
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 8.0),
            Text(
             user?.displayName ?? "",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '( ${user?.email} )',
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 16.0),
             ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.redAccent,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await RestApiClientService.signOut(context: context);
                      Navigator.of(context)
                          .pushReplacement(_routeToSignInScreen());
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
