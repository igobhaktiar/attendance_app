import 'package:attendance_app/config/app_routes.dart';
import 'package:attendance_app/data/models/office_model.dart';
import 'package:attendance_app/data/models/user_model.dart';
import 'package:attendance_app/domain/usecases/office_usecases.dart';
import 'package:attendance_app/domain/usecases/user_usecases.dart';
import 'package:attendance_app/presentation/map/controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class BoardingController extends GetxController {
  final UserUseCases userUseCase = Get.find<UserUseCases>();
  final officeUseCase = Get.find<OfficeUseCases>();
  final mapViewController = Get.find<MapViewController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController officeNameController = TextEditingController();
  TextEditingController officeAddressController = TextEditingController();
  TextEditingController officeLatitudeController = TextEditingController();
  TextEditingController officeLongitudeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _observer();
  }

  void _observer() async {
    var user = await userUseCase.getUser();
    var office = await officeUseCase.getOfficeLocation();
    Future.delayed(const Duration(seconds: 2), () async {
      if (user == null) {
        Get.offNamed(AppRoutes.userBoarding);
      } else if (office == null) {
        Get.offNamed(AppRoutes.officeBoarding);
      } else {
        Get.offNamed(AppRoutes.main);
      }
    });
  }

  void saveUser() {
    try {
      if (nameController.text.isEmpty || emailController.text.isEmpty) {
        Get.snackbar(
          'Error !',
          'Name and email cannot be empty',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        var user = UserModel(
          id: const Uuid().v4(),
          name: nameController.text,
          email: emailController.text,
        );

        userUseCase.saveUser(user);
        Get.offNamed(AppRoutes.officeBoarding);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void saveOfficeLocation() {
    try {
      if (officeNameController.text.isEmpty ||
          officeAddressController.text.isEmpty ||
          officeLatitudeController.text.isEmpty ||
          officeLongitudeController.text.isEmpty) {
        Get.snackbar(
          'Error !',
          'All field cannot be empty',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        var office = OfficeLocationModel(
          name: officeNameController.text,
          address: officeAddressController.text,
          latitude: double.parse(officeLatitudeController.text),
          longitude: double.parse(officeLongitudeController.text),
        );

        officeUseCase.saveOfficeLocation(office);
        Get.offNamed(AppRoutes.main);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void saveLocation() {
    final selectedLocation = mapViewController.selectedLocationValue;
    if (selectedLocation != null) {
      officeLatitudeController.text = selectedLocation.latitude.toString();
      officeLongitudeController.text = selectedLocation.longitude.toString();
      Get.back();
    }
  }
}
