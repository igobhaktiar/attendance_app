import 'package:attendance_app/presentation/main/controller/main_controller.dart';
import 'package:attendance_app/presentation/main/widget/main_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.pages[controller.currentIndex],
        bottomNavigationBar: const MainBottomNavigation(),
      );
    });
  }
}
