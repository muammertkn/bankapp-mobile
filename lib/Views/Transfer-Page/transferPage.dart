import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:mobile_app/Controllers/Account-Controller/accountController.dart';
import 'package:mobile_app/Models/Account-Model/accountModel.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage>
    with TickerProviderStateMixin {
  AccountController accountController = Get.put(AccountController());
  List<BankingAccount> bankAccounts = <BankingAccount>[];

  TextEditingController sendMoneyAccountController = TextEditingController();
  TextEditingController sendMoneyEmailController = TextEditingController();
  TextEditingController sendMoneyAccountLabelController =
      TextEditingController();
  TextEditingController sendMoneyAmountController = TextEditingController();
  TextEditingController borrowMoneyAmountController = TextEditingController();
  TextEditingController borrowMoneyAccountController = TextEditingController();

  String defaultValue = ' ';
  TabController? controller;

  @override
  void initState() {
    accountController.getAccounts().then((accounts) {
      bankAccounts.addAll(accounts);
      print(bankAccounts[0]);
      print(bankAccounts[1]);
    });
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
              elevation: 1,
              automaticallyImplyLeading: false,
              bottom: TabBar(
                labelColor: Colors.white,
                labelStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.grey,
                controller: controller,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Send Money',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Borrow Money',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: accountController.getAccounts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TabBarView(
                controller: controller,
                children: <Widget>[
                  Center(child: sendMoneyWidget()),
                  Center(child: borrowMoneyWidget()),
                ],
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
        ),
      ),
    );
  }

  SingleChildScrollView sendMoneyWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                runSpacing: 20,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 180,
                        child: DropdownSearch(
                          onChanged: (String? value) {
                            sendMoneyAccountController.text = value!;
                          },
                          dropdownSearchDecoration:
                              InputDecoration(hintText: 'Select Account'),
                          mode: Mode.MENU,
                          items: [
                            ...List.generate(
                              bankAccounts.length,
                              (index) {
                                return (bankAccounts[index].label);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter Receiver Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 50),
                        child: SizedBox(
                          child: TextFormField(
                            controller: sendMoneyEmailController,
                            onFieldSubmitted: (val) {
                              sendMoneyEmailController.text = val.trim();
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Receiver Email',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    BorderSide(color: Colors.indigo, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Receiver Account Label',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 50),
                        child: TextFormField(
                          controller: sendMoneyAccountLabelController,
                          onFieldSubmitted: (val) {
                            sendMoneyAccountLabelController.text = val.trim();
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Receiver  Account Label',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide:
                                  BorderSide(color: Colors.indigo, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 50),
                        child: TextFormField(
                          controller: sendMoneyAmountController,
                          onFieldSubmitted: (val) {
                            sendMoneyAmountController.text = val.trim();
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: 'Amount',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide:
                                  BorderSide(color: Colors.indigo, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (await accountController.sendMoney(
                              sendMoneyAccountController.text.split(' ')[0],
                              sendMoneyEmailController.text,
                              sendMoneyAccountLabelController.text,
                              double.parse(sendMoneyAmountController.text),
                            ) ==
                            true) {
                          Get.snackbar(
                              'SUCCESS', 'Everything was perfect man!');
                        } else {
                          Get.snackbar('ERROR', 'Something went wrong!');
                        }
                      },
                      child: Text(
                        'Send',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView borrowMoneyWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                runSpacing: 20,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Receiver Account Label',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 50),
                          child: SizedBox(
                            width: 180,
                            child: DropdownSearch(
                              onChanged: (String? value) {
                                borrowMoneyAccountController.text = value!;
                              },
                              dropdownSearchDecoration:
                                  InputDecoration(hintText: 'Select Account'),
                              mode: Mode.MENU,
                              items: [
                                ...List.generate(
                                  bankAccounts.length,
                                  (index) {
                                    return (bankAccounts[index].label +
                                        ' - balance: '
                                            '${bankAccounts[index].balance} ₺');
                                  },
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 50),
                        child: TextFormField(
                          controller: borrowMoneyAmountController,
                          onFieldSubmitted: (val) {
                            borrowMoneyAmountController.text = val.trim();
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: 'Amount',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide:
                                  BorderSide(color: Colors.indigo, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (await accountController.borrowMoney(
                              borrowMoneyAccountController.text.split(' ')[0],
                              double.parse(borrowMoneyAmountController.text),
                            ) ==
                            true) {
                        } else {}
                      },
                      child: Text(
                        'Borrow',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
