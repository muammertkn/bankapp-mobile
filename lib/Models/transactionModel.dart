import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class Transactions {
  String transactionDate;
  double transactionAmount;
  final charts.Color barColor;
  Transactions({
    required this.transactionDate,
    required this.barColor,
    required this.transactionAmount,
  });
}