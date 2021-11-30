import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app/Models/transactionModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TransactionChartWidget extends StatefulWidget {
  final List<TransactionBar> transactions;
  const TransactionChartWidget({Key? key, required this.transactions})
      : super(key: key);

  @override
  State<TransactionChartWidget> createState() => _TransactionChartWidgetState();
}

class _TransactionChartWidgetState extends State<TransactionChartWidget> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<TransactionBar, String>> series = [
      charts.Series(
        id: 'TransactionBar',
        data: widget.transactions,
        domainFn: (TransactionBar transactions, _) =>
            transactions.transactionDate,
        measureFn: (TransactionBar transactions, _) =>
            transactions.transactionAmount,
        colorFn: (TransactionBar transactions, _) => transactions.barColor,
      ),
    ];

    return Container(
      height: 200,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          widget.transactions.isEmpty
              ? Center(
                  child: Text(
                    'You dont have transcations to show',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                )
              : Expanded(
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
