import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:traki/const/loading_const.dart';
import 'package:traki/const/size_config.dart';
import 'package:traki/controllers/register.dart';
import 'package:traki/widget/Button.dart';
import 'package:traki/widget/TextField.dart';
import 'package:traki/extentions/extentions.dart';

class Register extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _emailAddress = TextEditingController();
  final _passWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (controller) => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    FINDATextFormField(
                      labelText: "Email",
                      textEditingController: _emailAddress,
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return "Field can\'t be empty";
                        }
                      },
                    ),
                    FINDATextFormField(
                      labelText: "Name",
                      textEditingController: _name,
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return "Field can\'t be empty";
                        }
                      },
                    ),
                    FINDATextFormField(
                      labelText: "Phone",
                      textEditingController: _phone,
                      textInputType: TextInputType.phone,
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return "Field can\'t be empty";
                        }
                      },
                    ),
                    FINDATextFormField(
                      labelText: "Password",
                      textEditingController: _passWord,
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return "Field can\'t be empty";
                        }
                      },
                      obscureText: controller.isPasswordVisible,
                      suffixIcon: controller.isPasswordVisible
                          ? FeatherIcons.eyeOff
                          : FeatherIcons.eye,
                      suffixOnClick: () {
                        controller.togglePasswordAction();
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FINDAButton(
                      child: Text(
                        controller.loadingState == AppState.loading
                            ? "Registering..."
                            : "Register",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: controller.loadingState == AppState.loading
                          ? Colors.black.withOpacity(0.5)
                          : Colors.black,
                      onPressed: () async {
                        if (_formKey.currentState.validate())
                          await controller.registerAction(
                            _name.text,
                            _emailAddress.text,
                            _passWord.text,
                            _phone.text,
                          );
                      },
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    InkWell(
                      child: Text("Login"),
                      onTap: () {
                        Get.toNamed("/login");
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
