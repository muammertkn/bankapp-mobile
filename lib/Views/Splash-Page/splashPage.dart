import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Controllers/Authentication-Controller/authenticationController.dart';
import 'package:mobile_app/Views/Page-Navigation/pageNavigation.dart';
import 'package:mobile_app/Views/Register-Pages/signInPage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Authentication controller = Get.put(Authentication());
  bool? isTokenValid;

  Future checkIsAuthenticated() async {
    bool isValid = await controller.verifyUsersToken();
    setState(() {
      isTokenValid = isValid;
    });
  }

  @override
  void initState() {
    checkIsAuthenticated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isTokenValid == true
        ? SafeArea(
            child: AnimatedSplashScreen(
              centered: true,
              curve: Curves.fastOutSlowIn,
              animationDuration: Duration(seconds: 1),
              duration: 1500,
              splash: Icon(
                Icons.account_balance,
                size: 80,
                color: Colors.deepPurpleAccent,
              ),
              nextScreen: PageNavigation(),
            ),
          )
        : SafeArea(
            child: AnimatedSplashScreen(
              centered: true,
              curve: Curves.fastOutSlowIn,
              animationDuration: Duration(seconds: 1),
              duration: 1500,
              splash: Icon(
                Icons.account_balance,
                size: 80,
                color: Colors.deepPurpleAccent,
              ),
              nextScreen: SignInPage(),
            ),
          );
  }
}
