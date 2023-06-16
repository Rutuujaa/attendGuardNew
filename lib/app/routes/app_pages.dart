import 'package:get/get.dart';

import '../modules/attendance/bindings/attendance_binding.dart';
import '../modules/attendance/views/attendance_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/input_roll_no/bindings/input_roll_no_binding.dart';
import '../modules/input_roll_no/views/input_roll_no_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/scan_qr_code/bindings/scan_qr_code_binding.dart';
import '../modules/scan_qr_code/views/scan_qr_code_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(
        rollNo: '',
      ),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_QR_CODE,
      page: () => ScanQrCodeView(),
      binding: ScanQrCodeBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_ROLL_NO,
      page: () => const InputRollNoView(rollNo: ''),
      binding: InputRollNoBinding(),
    ),
    GetPage(
      name: _Paths.ATTENDANCE,
      page: () => AttendanceView(),
      binding: AttendanceBinding(),
    ),
  ];
}
