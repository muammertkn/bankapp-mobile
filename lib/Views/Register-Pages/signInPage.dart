import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Controllers/Authentication-Controller/authenticationController.dart';
import 'package:mobile_app/Views/Page-Navigation/pageNavigation.dart';
import 'package:mobile_app/Views/Register-Pages/signUpPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Authentication controller = Get.put(Authentication());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 240,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Icon(
                      Icons.account_balance,
                      color: Colors.deepPurpleAccent,
                      size: 180,
                    ),
                    Text(
                      'FakeBank',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 320,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: emailController,
                        onFieldSubmitted: (value) {
                          emailController.text = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                          ),
                          hintText: 'E-mail',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.indigo, width: 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        onFieldSubmitted: (value) {
                          passwordController.text = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                          ),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.indigo, width: 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (await controller.signIn(emailController.text,
                                  passwordController.text) ==
                              true) {
                            Get.offAll(PageNavigation());
                          } else {
                            Get.snackbar('ERROR', 'Something went wrong!');
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 110),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account yet?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(SignUpPage());
                        },
                        child: Text(
                          'SIGN UP!',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
