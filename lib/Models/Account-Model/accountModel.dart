import 'package:mobile_app/Models/Transaction-Model/transactionModel.dart';

class BankingAccount {
  final String? id;
  String label;
  double balance = 0.0; //! replace with double.
  final List<Transactions>? transactions;

  BankingAccount(
      {this.id, required this.label, required this.balance, this.transactions});

  factory BankingAccount.fromJson(Map<String, dynamic> json) {
    return BankingAccount(
      id: json['id'],
      label: json['label'],
      balance: json['balance'].toDouble(),
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
