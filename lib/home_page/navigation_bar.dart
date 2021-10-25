import 'package:flutter/material.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.bar_chart),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.account_balance),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.receipt_long),
        ),
      ],
    );
  }
}
