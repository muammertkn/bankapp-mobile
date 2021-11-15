import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/Controllers/Token-Controllers/customhttpClient.dart';

class Authentication {
  String url = 'http://bankapp.aziznal.com:3000/';
  var httpClient = CustomHttpClient();
  final storage = FlutterSecureStorage();
  Future<bool> signUp(
      String fullname, String email, String password, String confirmPassword,
      [String? birthDate, String? phoneNumber]) async {
    final signUpResponse = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'fullname': fullname,
        'email': email,
        'password': password,
        'birthDate': birthDate,
        'phoneNumber': phoneNumber,
      }),
    );
    if (signUpResponse.statusCode == 201) {
      final loginResponse = await signIn(email, password);
      if (loginResponse == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    final signInResponse = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{'email': email, 'password': password},
      ),
    );
    if (signInResponse.statusCode == 201) {
      await storage.write(key: 'access_token', value: signInResponse.body);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> logOut() async {
    try {
      await storage.delete(key: 'access_token');
      return true;
    } catch (e) {
      return false;
    }
  }
}
