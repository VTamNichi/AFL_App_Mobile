import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/user_api.dart';
import 'package:amateur_football_league_mobile/models/User.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final generalController = Get.put(GeneralController());

  Rx<User> user = User().obs;
  RxString dobParse = "".obs;

  // register variables
  RxBool obsPassRegister = true.obs;
  RxBool obsConfirmPassRegister = true.obs;

  RxBool emptyEmail = false.obs;
  RxBool emptyPass = false.obs;
  RxBool checkConfirmPass = false.obs;
  RxBool emptyName = false.obs;
  RxBool selectedGender = true.obs;

  RxBool emptyPhone = false.obs;

  RxBool emptyCode = false.obs;
  Rx<User> userRe = User().obs;

  // update user variables

  RxBool genderUpdate = true.obs;
  RxString dobUpdate = "".obs;

  RxBool emptyNameUpdate = false.obs;
  RxBool emptyPhoneUpdate = false.obs;

  // change password variable
  RxBool obsCurrentPass = true.obs;
  RxBool obsNewPass = true.obs;
  RxBool obsConfirmNewPass = true.obs;

  RxBool emptyCurrentPass = false.obs;
  RxBool emptyNewPass = false.obs;
  RxBool checkConfirmNewPass = false.obs;

  // reset password variable
  RxString textButton = "GỬI MÃ XÁC THỰC".obs;
  RxBool emptyEmailReset = false.obs;
  RxBool emailResetRead = false.obs;
  //RxString codeResetPass = "".obs;
  RxBool codeResetRead = false.obs;
  RxBool hasCode = false.obs;
  RxBool emptyCodeReset = false.obs;
  RxBool checkCodeReset = false.obs;
  RxBool obsNewPassReset = true.obs;
  RxBool emptyNewPassReset = false.obs;
  RxBool obsConfirmNewPassReset = true.obs;
  RxBool checkConfirmNewPassReset = false.obs;

  Future<String> registerGoogle(String email) async {
    User userReG = User();
    userReG.email = email;
    String msg = "";
    await UserAPI.registerGoogle(userReG).then((value) => msg = value);
    return msg;
  }

  Future<String> verifyEmail(
      String email,
      String password,
      String confirmPassword,
      String username,
      String address,
      String phone,
      String bio,
      int flag) async {
        String msg = "Lỗi";
    if (flag == 1) {
      if (email.isEmpty) {
      emptyEmail.value = true;
    } else {
      emptyEmail.value = false;
      userRe.value.email = email;
    }
    if (password.isEmpty) {
      emptyPass.value = true;
    } else {
      emptyPass.value = false;
      userRe.value.password = password;
    }
    if (confirmPassword != password) {
      checkConfirmPass.value = true;
    } else {
      checkConfirmPass.value = false;
    }
    if (username.isEmpty) {
      emptyName.value = true;
    } else {
      emptyName.value = false;
      userRe.value.username = username;
    }
    if (selectedGender.isTrue) {
      userRe.value.gender = "Nam";
    } else {
      userRe.value.gender = "Nữ";
    }
    if (generalController.dob.value.year >= DateTime.now().year) {
      generalController.emptyDOB.value = true;
    } else {
      generalController.emptyDOB.value = false;
      userRe.value.dateOfBirth = generalController.dob.value.toString();
    }
    userRe.value.address = address;
    if (phone.isEmpty) {
      emptyPhone.value = true;
    } else {
      emptyPhone.value = false;
      userRe.value.phone = phone;
    }
    userRe.value.bio = bio;

    if (emptyEmail.isFalse &&
        emptyPass.isFalse &&
        checkConfirmPass.isFalse &&
        emptyName.isFalse &&
        generalController.emptyDOB.isFalse &&
        emptyPhone.isFalse) {
      await UserAPI.verifyEmail(email, 1).then((value) => {msg = value});
    }
    }
    else {
      await UserAPI.verifyEmail(email, 1).then((value) => {msg = value});
    }

    return msg;
  }

  Future<String> registerUser(String email, String code) async {
    String msg = "Lỗi";
    if (code.isEmpty) {
      emptyCode.value = true;
    } else {
      emptyCode.value = false;
    }
    if (emptyCode.isFalse) {
      String check = "";
      await UserAPI.checkVerifyEmail(email, code)
          .then((value) => {check = value});
      if (check == "") {
        await UserAPI.registerUser(
                userRe.value, generalController.imageRegister.value.path)
            .then((value) => msg = value);
      }
    }
    return msg;
  }

  Future<String> updateUser(
      String username, String address, String phone, String bio) async {
    User userUpdate = User();
    String msg = "";
    if (username.isEmpty) {
      emptyNameUpdate.value = true;
    } else {
      emptyNameUpdate.value = false;
    }
    if (phone.isEmpty) {
      emptyPhoneUpdate.value = true;
    } else {
      emptyPhoneUpdate.value = false;
    }

    if (emptyNameUpdate.isFalse && emptyPhoneUpdate.isFalse) {
      userUpdate.id = user.value.id;
      userUpdate.email = user.value.email;
      userUpdate.username = username;
      userUpdate.gender = genderUpdate.isTrue ? "Male" : "Female";
      userUpdate.dateOfBirth =
          generalController.dobUpdatePick.value.year >= DateTime.now().year
              ? user.value.dateOfBirth
              : generalController.dobUpdatePick.toString();
      userUpdate.address = address;
      userUpdate.phone = phone;
      userUpdate.bio = bio;
      userUpdate.roleId = user.value.roleId;
      await UserAPI.updateUser(
              userUpdate, generalController.imageUpdate.value.path)
          .then((value) => msg = value);
    }
    return msg;
  }

  Future<String> changePassword(
      String currentPass, String newPass, String confirmNewPass) async {
    String msg = "";
    if (currentPass.isEmpty) {
      emptyCurrentPass.value = true;
    } else {
      emptyCurrentPass.value = false;
    }
    if (newPass.isEmpty) {
      emptyNewPass.value = true;
    } else {
      emptyNewPass.value = false;
    }
    if (newPass != confirmNewPass) {
      checkConfirmNewPass.value = true;
    } else {
      checkConfirmNewPass.value = false;
    }
    if (emptyCurrentPass.isFalse &&
        emptyNewPass.isFalse &&
        checkConfirmNewPass.isFalse) {
      await UserAPI.changePassword(user.value.id!, currentPass, newPass)
          .then((value) => msg = value);
    }
    return msg;
  }

  Future<String> getVerifyCode(String email) async {
    String msg = "Lỗi";
    if (email.isEmpty) {
      emptyEmailReset.value = true;
    } else {
      emptyEmailReset.value = false;
    }

    if (emptyEmailReset.isFalse) {
      await UserAPI.verifyEmail(email, 2).then((value) => {msg = value});
    }
    return msg;
  }

  Future<String> checkVerifyCodeReset(String email, String code) async {
    String msg = "Lỗi";
    if (code.isEmpty) {
      emptyCodeReset.value = true;
    } else {
      emptyCodeReset.value = false;
    }

    if (emptyCode.isFalse) {
      await UserAPI.checkVerifyEmail(email, code)
          .then((value) => {msg = value});
      if (msg == "") {
        checkCodeReset.value = true;
      }
    }
    return msg;
  }

  Future<String> resetPassword(
      String email, String newPassReset, String confirmNewPassReset) async {
    String msg = "Lỗi";
    if (newPassReset.isEmpty) {
      emptyNewPassReset.value = true;
    } else {
      emptyNewPassReset.value = false;
    }
    if (newPassReset != confirmNewPassReset) {
      checkConfirmNewPassReset.value = true;
    } else {
      checkConfirmNewPassReset.value = false;
    }
    if (emptyNewPassReset.isFalse && checkConfirmNewPassReset.isFalse) {
      await UserAPI.resetPassword(email, newPassReset)
          .then((value) => msg = value);
    }
    return msg;
  }
}
