import 'package:amateur_football_league_mobile/fetch_api/auth_api.dart';
import 'package:amateur_football_league_mobile/screens/login/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  RxBool obsPassLogin = true.obs;
  RxBool emptyEmailLogin = false.obs;
  RxBool emptyPassLogin = false.obs;

  Future<String> checkLogin(String email, String password) async {
    if (email.isEmpty) {
      emptyEmailLogin.value = true;
    } else {
      emptyEmailLogin.value = false;
    }
    if (password.isEmpty) {
      emptyPassLogin.value = true;
    } else {
      emptyPassLogin.value = false;
    }
    if (!emptyEmailLogin.value && !emptyPassLogin.value) {
      String message = "";
      await AuthAPI.checkLogin(email, password).then((dataFromServer) {
        message = dataFromServer;
      });
      return message;
    }
    return "Điền đầy đủ thông tin";
  }

  Future<String> loginGoogle(String tokenId) async {
    String statusLogin = "";
    await AuthAPI.loginWithToken(tokenId)
            .then((value) => statusLogin = value);
    return statusLogin;
  }

  logout() {
    AuthAPI.userLogout().then((value) {
      if (value) {
        Get.offAll(() => const LoginScreen(), duration: const Duration(microseconds: 600));
      }
      Fluttertoast.showToast(msg: "Đăng xuất thành công", fontSize: 18);
    });
  }
}
