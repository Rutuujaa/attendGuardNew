import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../providers/api_providers.dart';
import '../views/get_roomno_model.dart';

class AttendanceController extends GetxController {
  final GlobalKey<FormState> centerKey = GlobalKey<FormState>();
  final GetRoomNoRespProvider fetchAttendanceData = GetRoomNoRespProvider();
  // late GetRoomNoResp? _roomNo;
  final roomNo = Rx<String?>("");
  final present = Rx<String?>("");
  final absent = Rx<String?>("");
  final total = Rx<String?>("");
  //final centerNo = '4';

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getAttendance('3');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var isEditMode = false.obs;

  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;
  }

  Future<int> getAttendance(String centerNo) async {
    try {
      print('center is sucess');
      final response = await fetchAttendanceData.getAttendance('3');
      print('response');
      roomNo.value = response.roomNo;
      print(response);
      present.value = response.present.toString();
      absent.value = response.absent.toString();
      total.value = response.total.toString();
      return 0;
    } catch (e) {
      print('Error occurred: $e');
      return -2;
    }
  }
}
