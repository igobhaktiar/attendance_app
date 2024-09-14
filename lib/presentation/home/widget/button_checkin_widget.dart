import 'package:attendance_app/presentation/home/controller/button_checkin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonCheckInWidget extends GetWidget<ButtonCheckInController> {
  final VoidCallback onTap;

  const ButtonCheckInWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.spreadAnimationController,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Obx(() {
              return Container(
                width: 150 + (40 * controller.spreadAnimation.value),
                height: 150 + (40 * controller.spreadAnimation.value),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.isCheckIn.value == false
                      ? Colors.teal.withOpacity(
                          0.3 * (1 - controller.spreadAnimation.value))
                      : Colors.red.withOpacity(
                          0.3 * (1 - controller.spreadAnimation.value)),
                ),
              );
            }),
            // Main button
            GestureDetector(
              onTapDown: (_) => controller.onTapDown(),
              onTapCancel: () => controller.onTapUp(),
              onTapUp: (_) => controller.onTapUp(),
              onTap: () => controller.onTapDown(),
              child: Obx(() {
                return Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.isCheckIn.value == false
                        ? Colors.teal.withOpacity(1)
                        : Colors.red.withOpacity(1),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        onTap();
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.touch_app,
                                color: Colors.white, size: 40),
                            const SizedBox(height: 8),
                            Text(
                              controller.isCheckIn.value == false
                                  ? 'Check In'
                                  : 'Check Out',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
