import 'package:flutter/material.dart';
import 'package:mobile_app/home_page/navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: MainNavigationBar(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.menu,
                size: 36,
              ),
              onPressed: () => print("hello world!"),
            ),
            Icon(
              Icons.savings,
              size: 36,
            ),
            Icon(
              Icons.logout,
              size: 36,
            ),
          ],
        ),
      ),
    ));
  }
}
