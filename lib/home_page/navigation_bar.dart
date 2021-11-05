import 'package:flutter/material.dart';
import 'package:mobile_app/main.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeProvider.theme.primaryColor,
      child: BottomNavigationBar(
        items: [
          customNavigationBarItem(Icons.bar_chart, 'Graphs'),
          customNavigationBarItem(Icons.account_balance, 'Home'),
          customNavigationBarItem(Icons.receipt_long, 'Transactions'),
        ],
      ),
    );
  }
}

BottomNavigationBarItem customNavigationBarItem(
    IconData iconData, String label) {
  return BottomNavigationBarItem(
    icon: Icon(
      iconData,
    ),
    label: label,
  );
}
