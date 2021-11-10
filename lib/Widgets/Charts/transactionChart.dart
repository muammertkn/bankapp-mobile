import 'package:flutter/material.dart';
import 'package:mobile_app/Models/transactionModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TransactionChartWidget extends StatelessWidget {
  final List<Transactions> transactions;
  const TransactionChartWidget({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Transactions, String>> series = [
      charts.Series(
        id: 'Transactions',
        data: transactions,
        domainFn: (Transactions transactions, _) =>
            transactions.transactionDate,
        measureFn: (Transactions transactions, _) =>
            transactions.transactionAmount,
        colorFn: (Transactions transactions, _) => transactions.barColor,
      ),
    ];

    return Container(
      height: 200,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            child: charts.BarChart(
              series,
              animate: true,
            ),
          )
        ],
      ),
    );
  }
}
