import 'package:mobile_app/Models/Transaction-Model/transactionModel.dart';

class Accounts {
  final String? id;
  final String? label;
  final String? balance;
  final List<Transactions>? transactions;

  Accounts({this.id, this.label, this.balance, this.transactions});

  factory Accounts.fromJson(Map<String, dynamic> json) {
    return Accounts(
      id: json['id'],
      label: json['label'],
      balance: json['balance'],
      transactions: json['transactions'] != null
          ? List.from(json['transactions'])
              .map((e) => Transactions.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'label': label,
        'balance': balance,
        'transactions': transactions,
      };
}
