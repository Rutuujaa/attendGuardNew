import 'package:example_getx/app/modules/attendance/views/get_center_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CenterController extends GetxController {}

final GlobalKey<FormState> centerKey = GlobalKey<FormState>();
final Root fetchData = Root();
final centerNo = Rx<String?>("");
final centerName = Rx<String?>("");
final centerAddress = Rx<String?>("");
//final centerNo = '4';

final count = 0.obs;
@override
void onInit() {
  // super.onInit();
  centerNo("5");
}

@override
void onReady() {
  //super.onReady();
}

@override
void onClose() {
  // super.onClose();
}

var isEditMode = false.obs;

void toggleEditMode() {
  isEditMode.value = !isEditMode.value;
}

Future<int> center(String centerNo) async {
  try {
    print('center is sucess');
    final response = await fetchData;
    print(response);
    print('Center No: ${centerNo}');
    print('Center Name: ${centerName}');
    print('Center Address: ${centerAddress}');
    return 0;
  } catch (e) {
    print('Error occurred: $e');
    return -2;
  }
}
