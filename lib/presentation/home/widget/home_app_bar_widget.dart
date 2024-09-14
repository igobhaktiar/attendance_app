import 'package:attendance_app/config/app_colors.dart';
import 'package:attendance_app/presentation/home/controller/home_controller.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBarWidget extends GetWidget<HomeController> {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Hello,',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 5),
                Obx(() {
                  return Text(
                    controller.fullName,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '${controller.officeName} - ${controller.officeAddress}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        const Icon(
          FluentSystemIcons.ic_fluent_alert_filled,
          size: 32,
          color: AppColors.primary,
        ),
      ],
    );
  }
}
