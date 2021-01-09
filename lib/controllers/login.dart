import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traki/const/colors.dart';
import 'package:traki/const/loading_const.dart';
import 'package:traki/services/auth.dart';

class LogInController extends GetxController {
  AppState loadingState = AppState.none;
  bool isPasswordVisible = true;

  void togglePasswordAction() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  loginAction(email, password) async {
    loadingState = AppState.loading;
    update();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await login(email, password);

    if (response.statusCode == 200) {
      prefs.setString("user", response.body);
      Get.offAndToNamed("/profile");
    } else {
      loadingState = AppState.none;
      update();
      Get.snackbar(
        null,
        "Error in logging in",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        borderRadius: 5,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        backgroundColor: hexToColor("#f60200"),
      );
    }
  }
}
