import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/models/User.dart';
import 'package:amateur_football_league_mobile/screens/login/login_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as securestorage;
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AuthAPI {
  static Future<String> checkLogin(String email, String password) async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    const storage = securestorage.FlutterSecureStorage();
    final userController = GetX.Get.put(UserController());
    String message = "";
    try {
      final response = await http.post(Uri.parse("https://afootballleague.ddns.net/api/v1/auth/login-email-password"),
              headers: <String, String>{
                HttpHeaders.contentTypeHeader: 'application/json',
              },
              body: jsonEncode(data));
      if(response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        User user = User.fromJson(bodyJson["userVM"]);
        storage.write(key: "accessToken", value: bodyJson['accessToken']);
        userController.user.value = user;
        userController.dobParse.value = DateFormat('yyyy-MM-dd').format(DateTime.parse(user.dateOfBirth.toString()));
        message = "Đăng nhập thành công";
      } else if(response.statusCode == 404) {
        message = "Tài khoản không tồn tại";
      } else if(response.statusCode == 400) {
        message = "Sai mật khẩu";
      } else {
        message = "";
      }
    } catch (e) {
      return message;
    }
    return message;
  }

  static Future<String> loginWithToken(String tokenId) async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["tokenId"] = tokenId;
    const storage = securestorage.FlutterSecureStorage();
    final userController = GetX.Get.put(UserController());
    String message = "";
    try {
      final response = await http.post(Uri.parse("https://afootballleague.ddns.net/api/v1/auth/login-with-google"),
              headers: <String, String>{
                HttpHeaders.contentTypeHeader: 'application/json',
              },
              body: jsonEncode(data));
      if(response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        User user = User.fromJson(bodyJson["userVM"]);
        storage.write(key: "accessToken", value: bodyJson['accessToken']);
        userController.user.value = user;
        message = "Đăng nhập thành công";
      } else if(response.statusCode == 404) {
        message = "Tài khoản không tồn tại";
      } else if(response.statusCode == 400) {
        message = "Tài khoản đã bị khóa";
      } else {
        message = "";
      }
    } catch (e) {
      return message;
    }
    return message;
  }

  static Future<bool> userLogout() async {
    const storage = securestorage.FlutterSecureStorage();
    final userController = GetX.Get.put(UserController());
    String token = await storage.read(key: "accessToken") ?? "";
    if (token.isEmpty) {
      GetX.Get.offAll(const LoginScreen(),
          transition: GetX.Transition.leftToRightWithFade,
          duration: const Duration(milliseconds: 500));
      throw Exception("Error: UnAuthentication");
    } else {
      String token = await storage.read(key: "accessToken") ?? "";
      String email = userController.user.value.email.toString();
      if (email.isNotEmpty && token != "") {
        final Map<String, String> data = <String, String>{};
        data['email'] = email.toLowerCase();
        final response = await http.post(
          Uri.parse("https://afootballleague.ddns.net/api/v1/auth/logout"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(data),
        );
        if (response.statusCode == 200) {
          storage.deleteAll();
          return true;
        }
      }
      storage.deleteAll();
      return true;
    }
  }
}
