import 'package:mobile_app/Models/User-Models/otherPersonModel.dart';

class Transactions {
  final String? action;
  final int? amount;
  final String? date;
  final String? id;
  final OtherPerson? otherPerson;

  Transactions(
      {this.action, this.amount, this.date, this.id, this.otherPerson});

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
        id: json['id'],
        action: json['action'],
        amount: json['amount'],
        date: json['date'],
        otherPerson: json['otherPerson'] != null
            ? OtherPerson.fromJson(json['otherPerson'])
            : null);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'action': action,
        'amount': amount,
        'date': date,
        'id': id,
        'otherPerson': otherPerson
      };
}