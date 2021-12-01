import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Controllers/Account-Controller/accountController.dart';
import 'package:mobile_app/Models/User-Models/userModel.dart';
import 'package:mobile_app/Views/Settings-Page/settingsPage.dart';
import 'package:mobile_app/Widgets/Account-Cards/cardWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  AccountController controller = Get.put(AccountController());

  @override
  void initState() {
    controller.getUser().then((user) {
      setState(() {
        this.user = user;
      });
    });
    super.initState();
  }

  bool isTL = true;
  String allEntities() {
    dynamic allBalance = 0;
    for (dynamic i = 0; i < user?.accounts?.length; i++) {
      allBalance = allBalance + user?.accounts?[i].balance;
    }
    return isTL == true
        ? allBalance.toString() + ' ₺'
        : (allBalance / 15).floorToDouble().toString() + ' €';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return showData();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          Scaffold(
            body: Center(
              child: Text(
                'Waiting for the response',
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  SafeArea showData() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(
                            SettingsPage(
                              user: user!,
                            ),
                          );
                        },
                        icon: Icon(Icons.settings),
                        color: Colors.deepPurpleAccent,
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () {
                          //! Add logout function
                        },
                        icon: Icon(Icons.logout_outlined),
                        color: Colors.deepPurpleAccent,
                        iconSize: 35,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Total Balance',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isTL = !isTL;
                            });
                          },
                          icon: Icon(
                              CupertinoIcons.arrow_right_arrow_left_circle),
                          color: Colors.deepPurpleAccent,
                          iconSize: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 240,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            /* '12000' + ' ₺', */
                            allEntities(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, top: 12),
                    child: Text(
                      'Your Accounts',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 279,
                  width: double.infinity,
                  color: Colors.white,
                  child: user?.accounts?.length == 0
                      ? Center(
                          child: Text('You do not create account'),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics:
                              const PageScrollPhysics(), // this for snapping
                          itemCount: user?.accounts?.length,
                          itemBuilder: (_, index) {
                            return CardWidget(
                                accountLabel: '${user?.accounts?[index].label}',
                                balance: '${user?.accounts?[index].balance} ₺');
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
