import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:traki/const/loading_const.dart';
import 'package:traki/models/user.dart';
import 'package:traki/services/auth.dart';

class ProfileController extends GetxController {
  AppState loadingState = AppState.none;
  User user;

  profileAction() async {
    try {
      loadingState = AppState.loading;
      update();
      var response = await profile();
      user = User.fromJson(json.decode(response.body));
      loadingState = AppState.none;
    } on SocketException {
      loadingState = AppState.noInternet;
    } catch (e) {
      loadingState = AppState.error;
    }
    print(loadingState);
    update();
  }

  @override
  void onInit() {
    profileAction();
    super.onInit();
  }
}
