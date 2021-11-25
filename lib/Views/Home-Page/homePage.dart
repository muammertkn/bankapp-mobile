import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Controllers/Account-Controller/accountController.dart';
import 'package:mobile_app/Controllers/Authentication-Controller/authenticationController.dart';
import 'package:mobile_app/Models/User-Models/userModel.dart';
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

  String allEntities() {
    dynamic allBalance = 0;
    for (dynamic i = 0; i < user?.accounts?.length; i++) {
      allBalance = allBalance + user?.accounts?[i].balance;
    }
    return allBalance.toString();
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
                    color: Colors.indigo,
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
                          print('add settings page');
                        },
                        icon: Icon(Icons.settings),
                        color: Colors.indigo,
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
                    child: Text(
                      'Total Balance',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                height: 280,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(), // this for snapping
                    itemCount: user?.accounts?.length,
                    itemBuilder: (_, index) {
                      return CardWidget(
                          accountLabel: '${user?.accounts?[index].label}',
                          balance: '${user?.accounts?[index].balance}');
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
