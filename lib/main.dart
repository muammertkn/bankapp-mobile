import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Views/Register-Pages/signInPage.dart';

import 'Views/Page-Navigation/pageNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]); */
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
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
