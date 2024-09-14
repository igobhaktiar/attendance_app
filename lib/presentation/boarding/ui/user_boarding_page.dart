import 'package:attendance_app/config/app_colors.dart';
import 'package:attendance_app/core/widget/button_primary_widget.dart';
import 'package:attendance_app/core/widget/textfield_primary_widget.dart';
import 'package:attendance_app/presentation/boarding/controller/boarding_controller.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserBoardingPage extends GetWidget<BoardingController> {
  const UserBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Container(
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
                    'Welcome to \nAttendance App',
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
                    'Please input your name and email to continue',
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
              'Name',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFieldPrimaryWidget(
              controller: controller.nameController,
              text: 'Input your name...',
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Email',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFieldPrimaryWidget(
              controller: controller.emailController,
              text: 'Input your email...',
            ),
            const SizedBox(
              height: 16,
            ),
            ButtonPrimaryWidget(
              onPressed: () => controller.saveUser(),
              text: 'Next',
              color: AppColors.primary,
              texColor: Colors.white,
              icon: const Icon(
                FluentSystemIcons.ic_fluent_chevron_right_filled,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
