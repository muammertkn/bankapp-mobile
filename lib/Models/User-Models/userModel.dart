import 'package:mobile_app/Models/Account-Model/accountModel.dart';

class User {
  final String email;
  final String fullname;
  final String? birthDate;
  final String? phoneNumber;
  final List<BankingAccount>? accounts;
  final double? debt;

  User(
      {required this.email,
      required this.fullname,
      required this.debt,
      this.birthDate,
      this.phoneNumber,
      this.accounts});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      fullname: json['fullname'],
      birthDate: json['birtDate'],
      phoneNumber: json['phoneNumber'],
      accounts: json['accounts'] != null
          ? List.from(json['accounts'])
              .map((e) => BankingAccount.fromJson(e))
              .toList()
          : null,
      debt: json['debt'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'fullname': fullname,
        'birthDate': birthDate,
        'phoneNumber': phoneNumber,
        'accounts': accounts,
      };
}
