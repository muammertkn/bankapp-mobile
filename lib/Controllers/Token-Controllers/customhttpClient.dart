import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/Controllers/Token-Controllers/userStorageController.dart';

class CustomHttpClient extends http.BaseClient {
  final storage = FlutterSecureStorage();
  UserStorageSecureController secureController =
      Get.put(UserStorageSecureController());

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    var accessToken = await storage.read(key: 'access_token');
    await secureController.getJwtToken();
    request.headers.putIfAbsent('Authorization', () => 'Bearer $accessToken');
    return request.send();
  }
}
