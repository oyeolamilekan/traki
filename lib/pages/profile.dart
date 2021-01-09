import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:traki/const/date.dart';
import 'package:traki/const/loading_const.dart';
import 'package:traki/controllers/profile.dart';
import 'package:traki/extentions/extentions.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) => controller.loadingState == AppState.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.loadingState == AppState.none
                  ? Container(
                      margin: EdgeInsets.only(top: 10.h),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Name"),
                              Text(controller.user.data.name),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Email"),
                              Text(controller.user.data.email),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Phone"),
                              Text(controller.user.data.phone),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Created"),
                              Text(parseDateToString(
                                  controller.user.data.createdAt)),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Text("Something bad happened."),
                    ),
        ),
      ),
    );
  }
}
