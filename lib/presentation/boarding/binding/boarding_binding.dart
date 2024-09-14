import 'package:attendance_app/presentation/boarding/controller/boarding_controller.dart';
import 'package:attendance_app/presentation/map/controller/map_controller.dart';
import 'package:get/get.dart';

class BoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MapViewController>(MapViewController());
    Get.put<BoardingController>(BoardingController());
  }
}
