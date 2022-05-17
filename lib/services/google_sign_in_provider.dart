import 'package:amateur_football_league_mobile/controllers/auth_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider with ChangeNotifier {
  final _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  final authController = Get.put(AuthController());
  final userController = Get.put(UserController());

  Future<String> googleLogin(String toDo) async {
    String statusLogin = "";
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return "";
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      var response =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (toDo == "Login") {
        statusLogin = await authController.loginGoogle(await response.user!.getIdToken());
      } else {
        statusLogin = await userController.registerGoogle(response.user!.email.toString());
      }
      notifyListeners();
    } catch (e) {
      return statusLogin;
    }
    return statusLogin;
  }

  Future logout() async {
    _user = await _googleSignIn.signOut();
    const storage = FlutterSecureStorage();
    storage.deleteAll();
    notifyListeners();
  }
}
