import 'package:get/get.dart';

import '../controllers/input_roll_no_controller.dart';

class InputRollNoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputRollNoController>(
      () => InputRollNoController(),
    );
  }
}
