import 'package:attendance_app/config/app_colors.dart';
import 'package:attendance_app/presentation/home/controller/home_controller.dart';
import 'package:attendance_app/presentation/home/widget/button_checkin_widget.dart';
import 'package:attendance_app/presentation/home/widget/home_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Stack(
        children: [
          _buildContainerGradient(),
          _buildContainerAppBar(),
        ],
      ),
    );
  }

  Widget _buildContainerAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: 80, left: 32, right: 32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeAppBarWidget(),
            _buildContainerContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerContent() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Attendance',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _buildTimeInfo(),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ButtonCheckInWidget(
              onTap: () => controller.onPressCheckIn(),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTimeInfo() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.currentTime,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Text(controller.amPm),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            controller.currentDate,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildContainerGradient() {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.grey,
            AppColors.grey,
            AppColors.backGround,
            AppColors.backGround,
            AppColors.backGround,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.clamp,
          transform: GradientRotation(1),
        ),
      ),
    );
  }
}
