import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_app/Controllers/Account-Controller/accountController.dart';
import 'package:mobile_app/Models/Transaction-Model/transactionModel.dart';
import 'package:mobile_app/Models/transactionModel.dart';
import 'package:mobile_app/Widgets/Charts/transactionChart.dart';
import 'package:mobile_app/Widgets/Transaction-Cards/transactionCardWidget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  Widget transactionCards() {
    return ListView.builder(
      reverse: true,
      scrollDirection: Axis.vertical,
      itemCount: transactionsList.length,
      itemBuilder: (_, int index) {
        return TransactionWidget(
          transactionNo: '${transactionsList[index].otherPerson!.id}',
          transactionAmount: '${transactionsList[index].amount}',
          transactionPersonName:
              '${transactionsList[index].otherPerson?.fullname}',
          action: '${transactionsList[index].action}'.toUpperCase(),
          transactionTime: DateFormat('yyyy-M-dd').format(
            DateTime.parse(transactionsList[index].date!),
          ),
        );
      },
    );
  }

  List<TransactionBar> transactionBar = [];
  AccountController controller = Get.put(AccountController());
  List<Transactions> transactionsList = <Transactions>[];
  @override
  void initState() {
    controller.getTransactions().then(
      (transaction) {
        setState(() {
          transactionsList.addAll(transaction);
          List<TransactionBar> transactions = [
            ...List.generate(
              transactionsList.length < 2 ? transactionsList.length : 2,
              (index) {
                return TransactionBar(
                    transactionDate: DateFormat('yyyy-MM-dd').format(
                      DateTime.parse(transactionsList[index].date!),
                    ),
                    barColor: transactionsList[index].action! == 'SENT'
                        ? charts.ColorUtil.fromDartColor(Colors.red)
                        : charts.ColorUtil.fromDartColor(Colors.indigo),
                    action: transactionsList[index].action!,
                    transactionAmount: transactionsList[index].amount);
              },
            )
          ];
          transactionBar.addAll(transactions);
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getTransactions(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Transaction History',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*   SizedBox(
                      width: double.infinity,
                      child:
                          TransactionChartWidget(transactions: transactionBar),
                    ), */
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: transactionsList.isEmpty
                            ? Center(
                                child: Text('You do not have transactions'),
                              )
                            : transactionCards(),
                      ),
                    )
                  ],
                ),
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
}
