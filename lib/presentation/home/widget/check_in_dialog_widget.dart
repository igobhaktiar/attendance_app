import 'package:attendance_app/core/widget/button_primary_widget.dart';
import 'package:attendance_app/presentation/home/controller/button_checkin_controller.dart';
import 'package:attendance_app/presentation/map/ui/map_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class CheckInDialogWidget extends GetWidget<ButtonCheckInController> {
  const CheckInDialogWidget({
    super.key,
    required this.onCheckIn,
  });

  final VoidCallback onCheckIn;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: Get.width * 0.8,
        height: Get.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 300,
              child: MapViewWidget(),
            ),
            const SizedBox(height: 16),
            ButtonPrimaryWidget(
              onPressed: () => onCheckIn(),
              text: controller.isCheckIn.value == false
                  ? 'Check In'
                  : 'Check Out',
              color: controller.isCheckIn.value == false
                  ? Colors.teal
                  : Colors.red,
              icon: Icon(
                controller.isCheckIn.value == false
                    ? Ionicons.checkmark_done
                    : Ionicons.calendar_clear_sharp,
                color: Colors.white,
              ),
              texColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
