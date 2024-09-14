import 'package:attendance_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final mainTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
    ),
    useMaterial3: true,
  );
}
