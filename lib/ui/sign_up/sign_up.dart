import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _phoneNoController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordNoController = new TextEditingController();
  CountryCode _countryCode = CountryCode(code: 'IN', dialCode: '+91');
  bool isFocus = false;
  bool isRemember = false;
  void focus() {
    setState(() {
      isFocus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 16, right: 16),
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
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Center(
                  child: Image.network(
                      "https://img.freepik.com/free-vector/image-upload-concept-illustration_114360-996.jpg?size=626&ext=jpg"),
                ),
              ),
              Center(
                child: const Text(
                  "Create New Account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        color:
                        // isFocus
                        //     ? Colors.green :
                        Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        //onTap: focus,
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
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                       // onTap: focus,
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
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        //onTap: focus,
                        keyboardType: TextInputType.emailAddress,
                        controller: _passwordNoController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
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
                                  (states) =>
                                  BorderSide(width: 2, color: Colors.green),
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
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {},
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ))),
                    SizedBox(
                      height: 30,
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
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.1),
                              border: Border.all(color: Colors.grey)),
                          child: Icon(
                            Icons.face,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 120,
                          margin: EdgeInsets.only(left: 150, right: 150),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.1),
                              border: Border.all(color: Colors.grey)),
                          child: Icon(
                            Icons.g_mobiledata_rounded,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.1),
                              border: Border.all(color: Colors.grey)),
                          child: Icon(
                            Icons.apple,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey,fontSize: 14)),
                        TextSpan(
                            text: "Sign in",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.green,fontSize: 14)),
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
