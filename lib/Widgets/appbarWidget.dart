import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppbarWidget {
  static AppBar appBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.red),
      elevation: 1,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            color: Colors.indigo,
            iconSize: 35,
            onPressed: () {},
            icon: Icon(Icons.savings),
          ),
        ],
      ),
    );
  }
}
