import 'package:example_getx/app/modules/input_roll_no/get_photo_sign_resp_model.dart';
import 'package:example_getx/app/modules/input_roll_no/providers/get_photo_sign_resp_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputRollNoController extends GetxController {
  //TODO: Implement InputRollNoController

  final GlobalKey<FormState> rollNoFormKey = GlobalKey<FormState>();
  late TextEditingController rollNumberController;

  final GetPhotoSignRespProvider photoSignProvider = GetPhotoSignRespProvider();
  String rollNumber = "";
  final count = 0.obs;
  late GetPhotoSignResp? _photoSign;
  final photo = Rx<String?>("");
  final sign = Rx<String?>("");

  @override
  void onInit() {
    super.onInit();
    rollNumberController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    rollNumberController.dispose();
    super.onClose();
  }

  String? validateRollNo(String value) {
    print("validateMobileNo fired");
    if (!GetUtils.isNumericOnly(value) && value.length == 6) {
      return "Provide valid roll number";
    }
    return null;
  }

  Future<int> fetchPhotoSign() async {
    final valid = rollNoFormKey.currentState!.validate();
    if (!valid) {
      return -1;
    }
    rollNoFormKey.currentState!.save();
    try {
      _photoSign = await photoSignProvider.getPhotoSign(rollNumber);
      _photoSign!.myPrintInfo();
      photo.value = _photoSign!.photo;
      sign.value = _photoSign!.sign;
      return 0;
    } catch (e) {
      return -2;
    }
  }

  void increment() => count.value++;

  void verifyRollNumber(String text) {}
}

void verifyRollNumber(String rollNumber) {
  print('Roll number detected: $rollNumber');
  // Implement roll number verification logic here
  // You can use an API call or any other method to check if the roll number is correct or wrong.
  // You can display a dialog or navigate to a different page based on the verification result.
  // Example:
  if (rollNumber == '123456') {
    // Roll number is correct
    Get.toNamed(
        '/input-roll-no'); // Replace '/input_roll_no_page' with the actual route of your input roll number page
  } else {
    // Roll number is wrong
    Get.snackbar('Error', 'Invalid roll number');
  }
}

  // ...