import 'package:example_getx/app/constants/constants.dart';
import 'package:example_getx/app/modules/home/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var mobile = "";
  var password = "";
  String? token;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController mobileNoController, passwordController;
  final AuthProvider authProvider = AuthProvider();
  @override
  void onInit() {
    super.onInit();
    mobileNoController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    mobileNoController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateMobileNo(String value) {
    print("validateMobileNo fired");
    if (!GetUtils.isNumericOnly(value)) {
      return "Provide valid mobile number";
    }
    return null;
  }

  String? validatePassword(String value) {
    print("validatePassword fired");
    if (value.length < 6) {
      return "password must of of length 6 or more";
    }
    return null;
  }

  Future<void> checkLogin() async {
    final valid = loginFormKey.currentState!.validate();
    if (!valid) {
      return;
    }
    print('value of mobileno  is : ${mobile}');
    print('value of password  is : ${password}');
    loginFormKey.currentState!.save();
    print('form is valid');
    print('value of mobileno  is : ${mobile}');
    print('value of password  is : ${password}');
    token = await authProvider.loginCenterUser(mobile, password);
    ApiConstants.token = token!;
  }
}
