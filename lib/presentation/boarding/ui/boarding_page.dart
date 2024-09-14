import 'package:attendance_app/config/app_colors.dart';
import 'package:attendance_app/config/app_module.dart';
import 'package:attendance_app/presentation/boarding/widget/intro_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/app_routes.dart';
import '../../../core/widget/button_primary_widget.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox(child: IntroWidget())),
            ButtonPrimaryWidget(
              onPressed: () => Get.offNamed(AppRoutes.userBoarding),
              text: 'Get Started',
              color: Colors.white,
              texColor: AppColors.primary,
              icon: const Icon(
                FluentSystemIcons.ic_fluent_chevron_right_filled,
                color: AppColors.primary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
