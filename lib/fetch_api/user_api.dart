import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/models/User.dart';
import 'package:dio/dio.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class UserAPI {
  static Future<String> registerGoogle(User user) async {
    final userController = GetX.Get.put(UserController());
    String message = "";
    try {
      FormData formData = FormData.fromMap({
        "Email": user.email,
        "RoleId": 4,
      });
      Response response =
          await Dio().post(urlApi + "users",
              data: formData,
              options: Options(headers: <String, String>{
                HttpHeaders.contentTypeHeader: 'multipart/form-data',
              }));
      if (response.statusCode == 201) {
        User user = User.fromJson(response.data);
        userController.user.value = user;
        message = "Đăng ký thành công";
      } else if (response.statusCode == 400) {
        message = "Tài khoản đã tồn tại";
      } else {
        message = "";
      }
    } on DioError {
      return "Tài khoản đã tồn tại";
    }
    return message;
  }

  static Future<String> registerUser(User user, String filePath) async {
    final userController = GetX.Get.put(UserController());
    String message = "";
    try {
      FormData formData;
      if (filePath.isEmpty) {
        formData = FormData.fromMap({
          "Email": user.email,
          "Password": user.password,
          "Username": user.username,
          "Gender": user.gender == "Nam" ? "Male" : "Female",
          "DateOfBirth": user.dateOfBirth,
          "Address": user.address,
          "Phone": user.phone,
          "Bio": user.bio,
          "IdentityCard": user.identityCard,
          "PhoneBusiness": user.phoneBusiness,
          "NameBusiness": user.nameBusiness,
          "TINBusiness": user.tinbusiness,
          "RoleId": 4,
        });
      } else {
        formData = FormData.fromMap({
          "Email": user.email,
          "Password": user.password,
          "Username": user.username,
          "Gender": user.gender == "Nam" ? "Male" : "Female",
          "DateOfBirth": user.dateOfBirth,
          "Address": user.address,
          "Phone": user.phone,
          "Avatar": await MultipartFile.fromFile(filePath, filename: "avatar"),
          "Bio": user.bio,
          "IdentityCard": user.identityCard,
          "PhoneBusiness": user.phoneBusiness,
          "NameBusiness": user.nameBusiness,
          "TINBusiness": user.tinbusiness,
          "RoleId": 4,
        });
      }
      Response response =
          await Dio().post(urlApi + "users",
              data: formData,
              options: Options(headers: <String, String>{
                HttpHeaders.contentTypeHeader: 'multipart/form-data',
              }));
      if (response.statusCode == 201) {
        User user = User.fromJson(response.data);
        userController.user.value = user;
        message = "";
      } else if (response.statusCode == 400) {
        message = "Tài khoản đã tồn tại";
      } else {
        message = "Không kết nối được với máy chủ";
      }
    } on DioError {
      return message;
    }
    return message;
  }

  static Future<String> verifyEmail(String email, int toDo) async {
    String message = "";
    try {
      final response = await http.post(
          Uri.parse(
              urlApi + "auth/send-verify-code?email=" +
                  email +
                  "&toDo=" +
                  toDo.toString()),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });

      if (response.statusCode == 200) {
        message = "";
      } else if (response.statusCode == 404) {
        message = "Tài khoản chưa tồn tại trong hệ thống";
      } else if (response.statusCode == 400) {
        message = "Tài khoản đã tồn tại trong hệ thống";
      } else {
        message = "Không kết nối được với máy chủ";
      }
    } catch (e) {
      return message;
    }
    return message;
  }

  static Future<String> checkVerifyEmail(String email, String code) async {
    String message = "";
    try {
      final response = await http.post(
          Uri.parse(
              urlApi + "auth/check-verify-code?email=" +
                  email +
                  "&code=" +
                  code),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });

      if (response.statusCode == 200) {
        message = "";
      } else if (response.statusCode == 400) {
        message = "Mã xác nhận không hợp lệ hoặc đã hết hạn";
      } else {
        message = "Không kết nối được với máy chủ";
      }
    } catch (e) {
      return message;
    }
    return message;
  }

  static Future<String> updateUser(User user, String filePath) async {
    final userController = GetX.Get.put(UserController());
    String message = "";
    try {
      FormData formData;
      if (filePath.isEmpty) {
        formData = FormData.fromMap({
          "Id": user.id,
          "Username": user.username,
          "Gender": user.gender,
          "DateOfBirth": user.dateOfBirth,
          "Address": user.address,
          "Phone": user.phone,
          "Bio": user.bio,
          "IdentityCard": user.identityCard,
          "PhoneBusiness": user.phoneBusiness,
          "NameBusiness": user.nameBusiness,
          "TINBusiness": user.tinbusiness,
        });
      } else {
        formData = FormData.fromMap({
          "Id": user.id,
          "Username": user.username,
          "Gender": user.gender,
          "DateOfBirth": user.dateOfBirth,
          "Address": user.address,
          "Phone": user.phone,
          "Avatar": await MultipartFile.fromFile(filePath, filename: "avatar"),
          "Bio": user.bio,
          "IdentityCard": user.identityCard,
          "PhoneBusiness": user.phoneBusiness,
          "NameBusiness": user.nameBusiness,
          "TINBusiness": user.tinbusiness,
        });
      }
      Response response =
          await Dio().put(urlApi + "users",
              data: formData,
              options: Options(headers: <String, String>{
                HttpHeaders.contentTypeHeader: 'multipart/form-data',
              }));
      if (response.statusCode == 201) {
        User user = User.fromJson(response.data);
        userController.user.value = user;
        message = "Cập nhật thành công";
      } else if (response.statusCode == 404) {
        message = "Tài khoản không tồn tại";
      } else {
        message = "";
      }
    } on DioError {
      return message;
    }
    return message;
  }

  static Future<String> changePassword(
      int id, String currentPass, String newPass) async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["currentPassword"] = currentPass;
    data["newPassword"] = newPass;
    String message = "";
    try {
      final response = await http.post(
          Uri.parse(
              urlApi + "users/change-password"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        message = "Đổi mật khẩu thành công";
      } else if (response.statusCode == 404) {
        message = "Tài khoản không tồn tại";
      } else if (response.statusCode == 400) {
        message = "Sai mật khẩu";
      } else {
        message = "";
      }
    } catch (e) {
      return message;
    }
    return message;
  }

  static Future<String> resetPassword(String email, String newPass) async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["newPassword"] = newPass;
    String message = "";
    try {
      final response = await http.post(
          Uri.parse(
              urlApi + "users/reset-password"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        message = "Đổi mật khẩu thành công";
      } else {
        message = "";
      }
    } catch (e) {
      return message;
    }
    return message;
  }
}
