import 'package:mobile_app/Models/Account-Model/accountModel.dart';

class Users {
  final String id;
  final String email;
  final String fullname;
  final String password;
  final String? birthDate;
  final String? phoneNumber;
  final List<Accounts>? accounts;

  Users(
      {required this.id,
      required this.email,
      required this.fullname,
      required this.password,
      this.birthDate,
      this.phoneNumber,
      this.accounts});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      email: json['email'],
      fullname: json['fullname'],
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
        'fullname': fullname,
        'password': password,
        'birthDate': birthDate,
        'phoneNumber': phoneNumber,
        'accounts': accounts,
      };
}
