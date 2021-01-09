import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traki/const/loading_const.dart';
import 'package:traki/services/auth.dart';

class RegisterController extends GetxController {
  AppState loadingState = AppState.none;
  bool isPasswordVisible = true;

  void togglePasswordAction() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  registerAction(name, email, password, phone) async {
    try {
      loadingState = AppState.loading;
      update();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var response = await register(name, email, password, phone);
      print(response.body);
      if (response.statusCode == 200) {
        prefs.setString("user", response.body);
        Get.offAndToNamed("/profile");
      }
      loadingState = AppState.none;
    } on SocketException {
      loadingState = AppState.noInternet;
    } catch (e) {
      loadingState = AppState.error;
    }
    update();
  }
}
