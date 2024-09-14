import 'package:attendance_app/presentation/home/controller/button_checkin_controller.dart';
import 'package:get/get.dart';

class ButtonCheckInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ButtonCheckInController>(() => ButtonCheckInController());
  }
}
