import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/models/User.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

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
          await Dio().post("https://afootballleague.ddns.net/api/v1/users",
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
    } on DioError catch (e) {
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
          await Dio().post("https://afootballleague.ddns.net/api/v1/users",
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
    } on DioError catch (e) {
      return message;
    }
    return message;
  }

  static Future<String> verifyEmail(String email, int toDo) async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    //final userController = GetX.Get.put(UserController());
    //String message = "";
    //try {
    return "123456";
    //   final response = await http.post(Uri.parse("https://afootballleague.ddns.net/api/v1/auth/login-with-google"),
    //           headers: <String, String>{
    //             HttpHeaders.contentTypeHeader: 'application/json',
    //           },
    //           body: jsonEncode(data));
    //   if(response.statusCode == 200) {
    //     var bodyJson = json.decode(utf8.decode(response.bodyBytes));
    //     User user = User.fromJson(bodyJson);
    //     userController.user.value = user;
    //     message = "Đăng nhập thành công";
    //   } else if(response.statusCode == 404) {
    //     message = "Tài khoản không tồn tại";
    //   } else if(response.statusCode == 400) {
    //     message = "Tài khoản đã bị khóa";
    //   } else {
    //     message = "";
    //   }
    // } catch (e) {
    //   return message;
    // }
    // return message;
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
          await Dio().put("https://afootballleague.ddns.net/api/v1/users",
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
    } on DioError catch (e) {
      return message;
    }
    return message;
  }

  static Future<String> changePassword(
      int id, String currentPass, String newPass) async {
    String message = "";
    try {
      final response = await http.patch(
          Uri.parse(
              "https://afootballleague.ddns.net/api/v1/users/change-password?id=" +
                  id.toString() +
                  "&current-password=" + currentPass + "&new-password=" + newPass),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
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
    String message = "";
    try {
      final response = await http.patch(
          Uri.parse(
              "https://afootballleague.ddns.net/api/v1/users/reset-password?email=" + email + "&new-password=" + newPass),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
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
