import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Views/Home-Page/homePage.dart';
import 'package:mobile_app/Views/Transactions-Page/transactionsPage.dart';
import 'package:mobile_app/Views/Transfer-Page/transferPage.dart';

//! change widget name
class PageNavigation extends StatefulWidget {
  const PageNavigation({Key? key}) : super(key: key);

  @override
  _PageNavigationState createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  int selectedPage = 1;
  @override
  void initState() {
    super.initState();
  }

  final _pageOptions = [TransactionsPage(), HomePage(), TransferPage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          enableFeedback: true,
          elevation: 3,
          iconSize: 25,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex: selectedPage,
          backgroundColor: Colors.indigo,
          onTap: (index) {
            setState(
              () {
                selectedPage = index;
              },
            );
          },
          items: [
            BottomNavigationBarItem(
                tooltip: 'Graph',
                icon: Icon(
                  Icons.bar_chart,
                  size: 25,
                ),
                label: 'Graph'),
            BottomNavigationBarItem(
                tooltip: 'Home',
                icon: Icon(
                  Icons.account_balance,
                  size: 25,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                tooltip: 'Transfer',
                icon: Icon(
                  Icons.attach_money_sharp,
                  size: 25,
                ),
                label: 'Transfer'),
          ],
        ),
      ),
    );
  }
}
