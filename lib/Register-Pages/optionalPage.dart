import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Register-Pages/signInPage.dart';
import 'package:mobile_app/Register-Pages/signUpPage.dart';

class OptionalDetailsPage extends StatefulWidget {
  const OptionalDetailsPage({Key? key}) : super(key: key);

  @override
  _OptionalDetailsPageState createState() => _OptionalDetailsPageState();
}

class _OptionalDetailsPageState extends State<OptionalDetailsPage> {
  @override
  Widget build(BuildContext context) {
    bool? isAccept = false;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
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
                    'VERPARA',
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
                        //! Change to date input type
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Birthdate',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            hintText: 'Birthdate',
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
                        //! Change to number input type
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            hintText: 'Phone Number',
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
                        CheckboxListTile(
                          activeColor: Colors.indigo,
                          value: isAccept,
                          onChanged: (value) {
                            setState(() {
                              isAccept = value;
                            });
                          },
                          title: Text.rich(
                            TextSpan(
                              text: 'I accept the ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16.0),
                              children: <TextSpan>[
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      showAboutDialog(
                                        useRootNavigator: false,
                                        context: context,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(15),
                                          ),
                                          Text(
                                              """I, the can’t-possibly-know-any-better end user who 
probably just accepted this without even reading it, do 
hereby acknowledge that I’ve read and accepted the 
terms of the license, wherein the terms are listed 
below:
 1. I will donate my right kidney to the app dev.
 2. I will at least consider donating all my possesions 
 and savings to the developer.
 3. I know this is a fake app. I won’t sue the developer, 
 even if they actually steal all my money.
 4. I will hold the developer responsible for any dam-
 ages or losses incurred through the use of this 
 app""")
                                        ],
                                      );
                                    },
                                  text: 'License Agreement',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Get.to(SignUpPage());
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
