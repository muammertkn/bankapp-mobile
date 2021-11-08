import 'package:flutter/material.dart';
import 'package:mobile_app/home_page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeProvider.theme,
    );
  }
}

// This is a custom theme provider
class ThemeProvider {
  const ThemeProvider();

  static ThemeData theme = ThemeData(
    primarySwatch: Colors.indigo,
  );
}
