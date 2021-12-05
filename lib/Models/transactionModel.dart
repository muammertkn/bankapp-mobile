import 'package:charts_flutter/flutter.dart' as charts;

class TransactionBar {
  String transactionDate;
  double transactionAmount;
  String action;
  final charts.Color barColor;
  TransactionBar({
    required this.transactionDate,
    required this.barColor,
    required this.action,
    required this.transactionAmount,
  });
}
