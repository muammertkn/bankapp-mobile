import 'package:flutter/material.dart';

class AppbarWidget {
  static AppBar appBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: Colors.indigo,
            iconSize: 35,
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          IconButton(
            color: Colors.indigo,
            iconSize: 35,
            onPressed: () {},
            icon: Icon(Icons.savings),
          ),
          /*  IconButton(
            iconSize: 35,
            onPressed: () {},
            icon: Icon(Icons.logout_outlined),
          ), */
        ],
      ),
    );
  }
}
