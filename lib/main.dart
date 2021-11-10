import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Page-Navigation/pageNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageNavigation(),
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
