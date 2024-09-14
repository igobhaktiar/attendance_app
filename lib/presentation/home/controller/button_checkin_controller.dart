import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonCheckInController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController spreadAnimationController;
  late Animation<double> spreadAnimation;


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
  }

  @override
  void onClose() {
    spreadAnimationController.dispose();
    super.onClose();
  }

  void onTapDown() {
    spreadAnimationController.forward();
  }

  void onTapUp() {
    spreadAnimationController.reverse();
  }

}
