import 'package:attendance_app/presentation/boarding/binding/boarding_binding.dart';
import 'package:attendance_app/presentation/boarding/ui/boarding_page.dart';
import 'package:attendance_app/presentation/boarding/ui/map_location_page.dart';
import 'package:attendance_app/presentation/boarding/ui/office_location_boarding_page.dart';
import 'package:attendance_app/presentation/boarding/ui/user_boarding_page.dart';
import 'package:attendance_app/presentation/home/binding/button_checkin_binding.dart';
import 'package:attendance_app/presentation/home/binding/home_binding.dart';
import 'package:attendance_app/presentation/main/binding/main_binding.dart';
import 'package:attendance_app/presentation/main/ui/main_page.dart';
import 'package:attendance_app/presentation/boarding/ui/splash_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String main = '/main';
  static const String splash = '/splash';
  static const String boarding = '/boarding';
  static const String userBoarding = '/user-boarding';
  static const String officeBoarding = '/office-boarding';
  static const String mapLocation = '/map-location';

  static final pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      bindings: [
        MainBinding(),
        HomeBinding(),
        ButtonCheckInBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: BoardingBinding(),
    ),
    GetPage(
      name: AppRoutes.boarding,
      page: () => const BoardingPage(),
    ),
    GetPage(
      name: AppRoutes.userBoarding,
      page: () => const UserBoardingPage(),
      binding: BoardingBinding(),
    ),
    GetPage(
      name: AppRoutes.officeBoarding,
      page: () => OfficeLocationBoardingPage(),
      binding: BoardingBinding(),
    ),
    GetPage(
      name: AppRoutes.mapLocation,
      page: () => const MapLocationPage(),
      binding: BoardingBinding(),
    ),
  ];
}
