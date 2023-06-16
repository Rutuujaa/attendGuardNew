import 'package:example_getx/app/modules/attendance/views/attendance_view.dart';
import 'package:example_getx/app/modules/scan_qr_code/views/scan_qr_code_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../input_roll_no/views/input_roll_no_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key, required String rollNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screens = [
      ScanQrCodeView(key: UniqueKey()),
      InputRollNoView(
        key: UniqueKey(),
        rollNo: '12345',
      ),
      AttendanceView(key: UniqueKey()),
    ];

    return Scaffold(
      body: Obx(() => Center(
            child: screens[controller.index.value],
          )),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 228, 130, 55),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white24,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_2_outlined),
              label: 'QR Code',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.numbers),
              label: 'Roll No',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.summarize),
              label: 'Attendance',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
            ),
          ],
          currentIndex: controller.index.value,
          onTap: (index) {
            if (index != 3) {
              controller.index.value = index;
            } else {
              Get.back();
            }
          },
        );
      }),
    );
  }
}
