import 'package:attendance_app/config/app_colors.dart';
import 'package:attendance_app/config/app_routes.dart';
import 'package:attendance_app/core/widget/button_primary_widget.dart';
import 'package:attendance_app/core/widget/textfield_primary_widget.dart';
import 'package:attendance_app/presentation/boarding/controller/boarding_controller.dart';
import 'package:attendance_app/presentation/map/controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficeLocationBoardingPage extends StatelessWidget {
  OfficeLocationBoardingPage({super.key});

  final controller = Get.find<BoardingController>();
  final _mapViewController = Get.find<MapViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Office Location',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Please input your office location to continue',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Office Name',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFieldPrimaryWidget(
                controller: controller.officeNameController,
                text: 'Input your office name...',
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Office Address',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFieldPrimaryWidget(
                controller: controller.officeAddressController,
                text: 'Input your office address...',
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Latitude',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFieldPrimaryWidget(
                controller: controller.officeLatitudeController,
                text: 'Input your latitude...',
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Longitude',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFieldPrimaryWidget(
                controller: controller.officeLongitudeController,
                text: 'Input your longitude...',
              ),
              const SizedBox(
                height: 16,
              ),
              // select location
              ButtonPrimaryWidget(
                onPressed: () {
                  _mapViewController.isOfficeSet.value = false;
                  Get.toNamed(AppRoutes.mapLocation);
                },
                text: 'Select Location',
                color: AppColors.grey,
                texColor: AppColors.primary,
                icon: const Icon(
                  Icons.location_on,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonPrimaryWidget(
                onPressed: () {
                  controller.saveOfficeLocation();
                  _mapViewController.isOfficeSet.value = true;
                },
                text: 'Next',
                color: AppColors.primary,
                texColor: Colors.white,
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
