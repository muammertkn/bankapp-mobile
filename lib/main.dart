import 'package:flutter/material.dart';
import 'package:mobile_app/Register-Pages/optionalPage.dart';
import 'package:mobile_app/Register-Pages/signInPage.dart';
import 'package:mobile_app/Register-Pages/signUpPage.dart';
import 'package:mobile_app/home_page/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OptionalDetailsPage(),
      theme: ThemeProvider.theme,
    );
  }
}

// This is a custom theme
class ThemeProvider {
  const ThemeProvider();

  static ThemeData theme = ThemeData(
    primarySwatch: Colors.indigo,
  );
}
