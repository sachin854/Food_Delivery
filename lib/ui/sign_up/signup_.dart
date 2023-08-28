import 'package:country_code_picker/country_code_picker.dart';
import 'package:finalapppp/controller/bloc/signup/signup_event.dart';
import 'package:finalapppp/controller/bloc/signup/signup_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/bloc/signup/signup_bloc.dart';

class SignUpOld extends StatefulWidget {
 // static const routeName = "/signUp";
  const SignUpOld({super.key});

  @override
  State<SignUpOld> createState() => _SignUpOldState();
}

class _SignUpOldState extends State<SignUpOld> {
  TextEditingController? _phoneNoController;
  TextEditingController? _emailController;
  TextEditingController? _fullNameController;
  CountryCode _countryCode = CountryCode(code: 'IN', dialCode: '+91');
  bool isFocus = false;
  bool isRemember = false;
  void focus() {
    setState(() {
      isFocus = true;
    });
  }

  @override
  void initState() {
    _phoneNoController = TextEditingController();
    _emailController = TextEditingController();
    _fullNameController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    )),
                Container(

                  height: 200,width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Image.network(
                        "https://img.freepik.com/free-vector/image-upload-concept-illustration_114360-996.jpg?size=626&ext=jpg"),
                  ),
                ),
                Center(
                  child: const Text(
                    "Create New Account",
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  child: Column(
                    children: [
                      Container(
                        // padding:
                        //     const EdgeInsets.only(top: 20, bottom: 20),
                        decoration: BoxDecoration(
                          color:
                          // isFocus
                          //     ? Colors.green :
                          Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          //onTap: focus,
                          onChanged: (val) {
                          },
                          keyboardType: TextInputType.phone,
                          controller: _phoneNoController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone no",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: CountryCodePicker(
                              //padding: const EdgeInsets.only(top: 15),
                              onChanged: (CountryCode countryCode) {
                                setState(() {
                                  _countryCode = countryCode;
                                });
                              },
                              initialSelection: 'IN',
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                          ),
                          validator: (value) {
                            if (value!.length != 10) {
                              return "Please enter valid no"; //'Please enter valid phone number';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.disabled,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 56,
                        padding:
                        const EdgeInsets.only(top: 10,),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          // onTap: focus,
                          onChanged: (val) {
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 56,
                        padding:
                        const EdgeInsets.only(top: 10,),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          //onTap: focus,
                          onChanged: (val) {
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "FullName",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                    width: 2, color: Colors.green),
                              ),
                              activeColor: Colors.green.withOpacity(1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              value: isRemember,
                              onChanged: (newValue) {
                                setState(() {
                                  isRemember = newValue!;
                                });
                              }),
                          Text(
                            "Remember Me",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              onPressed: () {

                                signUpPressed();
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ))),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              indent: 20,
                              endIndent: 40,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          Text(
                            "or continue with",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Expanded(
                            child: Divider(
                                indent: 20,
                                endIndent: 40,
                                color: Colors.grey.withOpacity(0.2)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(color: Colors.grey)),
                            child: Icon(
                              Icons.face,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(color: Colors.grey)),
                            child: Icon(
                              Icons.g_mobiledata_rounded,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(color: Colors.grey)),
                            child: Icon(
                              Icons.apple,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 14)),
                          TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 14)),
                        ]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ),

      ),
    );
  }



Future<void> signUpPressed() async {
  var phoneNo = _phoneNoController!.text;
  var email = _emailController!.text;
  var fullName = _fullNameController!.text;
  // try {
    final FirebaseAuth auth = FirebaseAuth.instance;
     User? user;
     user=await auth.currentUser;
     final uid=user!.uid;
    print("uiddddd"+uid);
    DatabaseReference userRef =
        FirebaseDatabase.instance.reference().child('users');
    await userRef.child(uid).set({
      'phoneNo': phoneNo,
      'email': email,
      'uid': uid,
      'fullName': fullName,
    });
  // } catch (ex) {
  //   print('Something went wrong');
  // }
}
}
