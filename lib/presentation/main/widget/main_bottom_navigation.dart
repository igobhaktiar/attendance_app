import 'package:attendance_app/config/app_colors.dart';
import 'package:attendance_app/presentation/main/controller/main_controller.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavigation extends GetWidget<MainController> {
  const MainBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 84,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          color: AppColors.backGround,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: controller.changeIndex,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey,
            backgroundColor: AppColors.backGround,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_calendar_filled),
                label: 'Attendance',
              ),
              BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    });
  }
}
