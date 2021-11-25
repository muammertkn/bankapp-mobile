import 'dart:convert';
import 'package:mobile_app/Controllers/Token-Controllers/customhttpClient.dart';
import 'package:mobile_app/Models/Account-Model/accountModel.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/Models/User-Models/userModel.dart';
import 'package:mobile_app/Utils/endpoints.dart';

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
}
