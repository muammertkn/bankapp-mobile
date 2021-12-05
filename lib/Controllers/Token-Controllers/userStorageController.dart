import 'package:get_storage/get_storage.dart';

class UserStorageSecureController {
  final _storage = GetStorage();
  final _jwtToken = ' ';

  Future setToken(String jwtToken) async =>
      await _storage.write(_jwtToken, jwtToken);

  Future<dynamic> getJwtToken() async => await _storage.read(_jwtToken);

  Future deleteToken() async {
    await _storage.remove(_jwtToken);
  }
}
