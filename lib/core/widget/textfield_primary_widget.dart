import 'package:attendance_app/config/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldPrimaryWidget extends StatelessWidget {
  const TextFieldPrimaryWidget({
    super.key,
    required this.controller,
    required this.text,
  });

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        focusColor: AppColors.backGround,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  const BorderSide(
            color: Colors.grey,
          ),
        ),
        hintText: text,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
      ),
      controller: controller,
    );
  }
}
