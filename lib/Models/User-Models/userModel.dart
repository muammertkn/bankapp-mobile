import 'package:mobile_app/Models/Account-Model/accountModel.dart';

class Users {
  final String id;
  final String email;
  final String fullName;
  final String password;
  final String? birthDate;
  final String? phoneNumber;
  final List<Accounts>? accounts;

  Users(
      {required this.id,
      required this.email,
      required this.fullName,
      required this.password,
      this.birthDate,
      this.phoneNumber,
      this.accounts});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      password: json['password'],
      birthDate: json['birtDate'],
      phoneNumber: json['phoneNumber'],
      accounts: json['accounts'] != null
          ? List.from(json['accounts'])
              .map((e) => Accounts.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'email': email,
        'fullName': fullName,
        'password': password,
        'birthDate': birthDate,
        'phoneNumber': phoneNumber,
        'accounts': accounts,
      };
}
