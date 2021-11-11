import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app/Models/transactionModel.dart';
import 'package:mobile_app/Widgets/Charts/transactionChart.dart';
import 'package:mobile_app/Widgets/Transaction-Cards/transactionCardWidget.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List<Transactions> transactions = [
    Transactions(
      transactionDate: '01.01.2020',
      barColor: charts.ColorUtil.fromDartColor(Colors.indigo),
      transactionAmount: 12.000,
    ),
    Transactions(
      transactionDate: '02.02.2020',
      barColor: charts.ColorUtil.fromDartColor(Colors.indigo),
      transactionAmount: 30.000,
    ),
    Transactions(
      transactionDate: '03.04.2020',
      barColor: charts.ColorUtil.fromDartColor(Colors.indigo),
      transactionAmount: 45.000,
    ),
    Transactions(
      transactionDate: '11.01.2020',
      barColor: charts.ColorUtil.fromDartColor(Colors.indigo),
      transactionAmount: 40.000,
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                width: double.infinity,
                child: TransactionChartWidget(transactions: transactions),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        TransactionWidget(
                          transactionPersonName: 'Eren',
                          isSend: false,
                          transactionAmount: '120000',
                          transactionNo: '123-111-222',
                          transactionTime: '01.01.2022',
                        ),
                        TransactionWidget(
                          transactionPersonName: 'Aziz',
                          isSend: true,
                          transactionAmount: '12000',
                          transactionNo: '123-222-111',
                          transactionTime: '12.12.2022',
                        ),
                        TransactionWidget(
                          transactionPersonName: 'Muammer',
                          isSend: false,
                          transactionAmount: '12000',
                          transactionNo: '123-456-789',
                          transactionTime: '12.12.2022',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
