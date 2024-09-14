import 'package:attendance_app/config/app_colors.dart';
import 'package:attendance_app/presentation/boarding/controller/boarding_controller.dart';
import 'package:attendance_app/presentation/boarding/widget/intro_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetWidget<BoardingController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: IntroWidget(),
    );
  }
}