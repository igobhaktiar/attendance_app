import 'package:attendance_app/domain/usecases/office_usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/user_usecases.dart';

class ButtonCheckInController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController spreadAnimationController;
  late Animation<double> spreadAnimation;

  final _userUseCase = Get.find<UserUseCases>();

  var isCheckIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    spreadAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..repeat();

    spreadAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: spreadAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    checkInfo();
  }

  void checkInfo() async {
    var user = await _userUseCase.getUser();
    if (user != null) {
      isCheckIn.value = user.isPresent == null ? false : user.isPresent!;
    }
  }

  @override
  void onClose() {
    spreadAnimationController.dispose();
    checkInfo();
    super.onClose();
  }

  void onTapDown() {
    spreadAnimationController.forward();
  }

  void onTapUp() {
    spreadAnimationController.reverse();
  }

}
