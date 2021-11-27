import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_app/Controllers/Token-Controllers/customhttpClient.dart';
import 'package:mobile_app/Models/Account-Model/accountModel.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/Models/Transaction-Model/transactionModel.dart';
import 'package:mobile_app/Models/User-Models/userModel.dart';
import 'package:mobile_app/Models/transactionModel.dart';
import 'package:mobile_app/Utils/endpoints.dart';

import 'package:get/get.dart';

class AccountController {
  var httpClient = CustomHttpClient();
  Future<User> getUser() async {
    String url = Endpoints.getFullUserData;
    final rawUser = await httpClient.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (rawUser.statusCode == 200) {
      var userJson = json.decode(rawUser.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Error!');
    }
  }

  Future<List<Transactions>> getTransactions() async {
    String url = Endpoints.getTransactions;
    final rawTransactions = await httpClient.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (rawTransactions.statusCode == 200) {
      List<Transactions> transactions =
          (json.decode(rawTransactions.body) as List)
              .map((e) => Transactions.fromJson(e))
              .toList();
      print(transactions);
      return transactions;
    } else {
      throw Exception('Error!');
    }
  }

  Future<List<BankingAccount>> getAccounts() async {
    String url = Endpoints.getAccounts;
    final rawTransactions = await httpClient.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (rawTransactions.statusCode == 200) {
      List<BankingAccount> accounts =
          (json.decode(rawTransactions.body) as List)
              .map((e) => BankingAccount.fromJson(e))
              .toList();
      print(accounts[0]);
      return accounts;
    } else {
      throw Exception('Error!');
    }
  }

  Future<bool> sendMoney(String sendingAccountLabel, receiverEmail,
      receivingAccountLabel, double amount) async {
    String url = Endpoints.sendMoney;
    final rawTransactions = await httpClient.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'sendingAccountLabel': sendingAccountLabel,
          'receiverEmail': receiverEmail,
          'receivingAccountLabel': receivingAccountLabel,
          'amount': amount,
        },
      ),
    );
    if (rawTransactions.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future borrowMoney(String borrowingAccountLabel, double amount) async {
    String url = Endpoints.borrowMoney;
    final rawTransactions = await httpClient.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'borrowingAccountLabel': borrowingAccountLabel,
          'amount': amount,
        },
      ),
    );
    if (rawTransactions.statusCode == 201) {
      Get.snackbar('Success', 'WELL DONE!');
    } else if (rawTransactions.statusCode == 400) {
      Get.snackbar('Error', 'Given amount must be bigger than 0');
    } else if (rawTransactions.statusCode == 401) {
      Get.snackbar('Error', 'Invalid parameters');
    } else {
      Get.snackbar('Error', 'Transfer account not found!');
    }
  }
}
