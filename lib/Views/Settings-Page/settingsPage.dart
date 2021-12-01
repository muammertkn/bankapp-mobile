import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Controllers/Account-Controller/accountController.dart';
import 'package:mobile_app/Models/User-Models/userModel.dart';
import 'package:mobile_app/Views/Register-Pages/signInPage.dart';
import 'package:mobile_app/Widgets/Account-Cards/cardWidget.dart';

class SettingsPage extends StatefulWidget {
  User user;
  SettingsPage({required this.user, Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  TabController? controller;
  AccountController accountController = Get.put(AccountController());
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController deleteAccountLabelController = TextEditingController();
  TextEditingController transferAccountLabelController =
      TextEditingController();
  TextEditingController updateAccountLabelController = TextEditingController();
  TextEditingController addAccountLabelController = TextEditingController();
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  updateDisplayDialog(BuildContext context, int index) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Account Label'),
          content: TextFormField(
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(hintText: 'Enter new account label'),
            controller: updateAccountLabelController,
            onFieldSubmitted: (val) {
              updateAccountLabelController.text = val;
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Update'),
              onPressed: () async {
                if (await accountController.updateAccount(
                        widget.user.accounts![index].label,
                        updateAccountLabelController.text) ==
                    true) {
                  Get.offAll(SignInPage());
                } else {
                  Get.snackbar('Error', 'Something went wrong');
                }
              },
            )
          ],
        );
      },
    );
  }

  deleteDisplayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          child: AlertDialog(
            title: Text('Delete Account'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onFieldSubmitted: (val) {
                    deleteAccountLabelController.text = val;
                  },
                  controller: deleteAccountLabelController,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(hintText: 'Delete Account'),
                ),
                TextFormField(
                  onFieldSubmitted: (val) {
                    transferAccountLabelController.text = val;
                  },
                  controller: transferAccountLabelController,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(hintText: 'Transfer Account'),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Delete'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  if (await accountController.deleteAccount(
                          deleteAccountLabelController.text,
                          transferAccountLabelController.text) ==
                      true) {
                    Get.off(SignInPage());
                  } else {
                    Get.snackbar('Error', 'Something went wrong');
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }

  navigateDisplayDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('You have to sign in again'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('GO'),
              onPressed: () {
                Get.off(
                  SignInPage(),
                );
              },
            )
          ],
        );
      },
    );
  }

  addAccountDisplayDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add new account'),
          content: TextFormField(
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(hintText: 'Enter new account label'),
            controller: addAccountLabelController,
            onFieldSubmitted: (val) {
              addAccountLabelController.text = val;
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Update'),
              onPressed: () async {
                if (await accountController
                        .createAccount(addAccountLabelController.text) ==
                    true) {
                  Get.off(SignInPage());
                } else {
                  Get.snackbar('Error', 'Something went wrong');
                }
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(85),
          child: AppBar(
              elevation: 0,
              bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                labelColor: Colors.white,
                labelStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.grey,
                controller: controller,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Profile ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Accounts',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: personalSettings(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: accountSettings(),
            )
          ],
        ),
      ),
    );
  }

  Widget personalSettings() {
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: 15,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onFieldSubmitted: (val) {
                fullnameController.text = val;
              },
              controller: fullnameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Name Surname',
                hintText: widget.user.fullname,
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              onFieldSubmitted: (val) {
                emailController.text = val;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: widget.user.email,
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: birthdateController,
              onFieldSubmitted: (val) {
                birthdateController.text = val;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'BirthDate',
                hintText: widget.user.birthDate ?? 'Enter your Birthdate',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: phoneNumberController,
              onFieldSubmitted: (val) {
                phoneNumberController.text = val;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: widget.user.phoneNumber ?? 'Enter your phone number',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (await accountController.updatePersonalInformation(
                            fullnameController.text,
                            emailController.text,
                            birthdateController.text,
                            phoneNumberController.text) ==
                        true) {
                      Get.off(
                        SignInPage(),
                      );
                    } else {
                      Get.snackbar('Error', 'Something went wrong');
                    }
                  },
                  child: Text('UPDATE'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget accountSettings() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const PageScrollPhysics(), // this for snapping
              itemCount: widget.user.accounts?.length,
              itemBuilder: (_, index) {
                return CardWidget(
                  isSettingPage: true,
                  padding: EdgeInsets.all(5),
                  accountLabel: '${widget.user.accounts?[index].label}',
                  balance: '${widget.user.accounts?[index].balance}',
                  deleteFunction: () {
                    deleteDisplayDialog(
                      context,
                    );
                  },
                  updateFunction: () {
                    updateDisplayDialog(context, index);
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          addAccountDisplayDialog(context);
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
