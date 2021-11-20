import 'dart:convert';
import 'package:mobile_app/Models/Account-Model/accountModel.dart';
import 'package:http/http.dart' as http;

class AccountController {
  String addUrl = 'http://bankapp.aziznal.com:3000/add';
  String editUrl = 'http://bankapp.aziznal.com:3000/edit';
  String deleteUrl = 'http://bankapp.aziznal.com:3000/delete';
  String sendMoneyUrl = 'http://bankapp.aziznal.com:3000/delete';

  Future<bool> addAccount(Accounts accounts) async {
    final addAccountResponse = await http.post(
      Uri.parse(addUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, String?>{
          'label': accounts.label,
          'currency': accounts.currency,
        },
      ),
    );
    if (addAccountResponse.statusCode == 200) {
      var addedAccount = Accounts.fromJson(
        jsonDecode(addAccountResponse.body),
      );
      //print(addedAccount);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> editAccount(Accounts accounts) async {
    final addAccountResponse = await http.put(
      Uri.parse(editUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, String?>{
          'label': accounts.label,
          'currency': accounts.currency,
        },
      ),
    );
    if (addAccountResponse.statusCode == 200) {
      var addedAccount = Accounts.fromJson(
        jsonDecode(addAccountResponse.body),
      );
      //print(addedAccount);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteAccount(Accounts accounts) async {
    final addAccountResponse = await http.delete(
      Uri.parse(deleteUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, String?>{
          'id': accounts.id,
        },
      ),
    );
    if (addAccountResponse.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendMoney(String accountId, accountNo, amount) async {
    final addAccountResponse = await http.post(
      Uri.parse(sendMoneyUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, String?>{
          'accountId': accountId,
          'accountNo': accountNo,
          'amount': amount
        },
      ),
    );
    if (addAccountResponse.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
