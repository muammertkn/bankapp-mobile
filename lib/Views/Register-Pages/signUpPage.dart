import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Views/Register-Pages/optionalPage.dart';
import 'package:mobile_app/Views/Register-Pages/signInPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 240,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(
                      Icons.savings,
                      color: Colors.indigo,
                      size: 180,
                    ),
                    Text(
                      'FakeBank',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 440,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        runSpacing: 25,
                        alignment: WrapAlignment.center,
                        children: [
                          TextFormField(
                            controller: nameController,
                            onFieldSubmitted: (value) {
                              nameController.text = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Full name',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                              hintText: 'Full name',
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
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                              hintText: 'Confirm Password',
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
                          MaterialButton(
                            onPressed: () {
                              Get.to(
                                OptionalDetailsPage(),
                                arguments: [
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text
                                ],
                              );
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(SignInPage());
                        },
                        child: Text(
                          'Sign In!',
                          style: TextStyle(
                              color: Colors.indigo,
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
