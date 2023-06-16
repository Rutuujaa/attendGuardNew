import 'package:get/get.dart';

import '../controllers/attendance_controller.dart';
import '../controllers/center_controller.dart';

class AttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(
      () => AttendanceController(),
    );
    Get.lazyPut<CenterController>(
      () => CenterController(),
    );
  }
}
