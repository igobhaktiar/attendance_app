import 'package:attendance_app/presentation/attendance/ui/attendance_page.dart';
import 'package:attendance_app/presentation/home/ui/home_page.dart';
import 'package:attendance_app/presentation/profile/ui/profile_page.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  final pages = [
    const HomePage(),
    const AttendancePage(),
    const ProfilePage(),
  ];

  void changeIndex(int index) {
    _currentIndex.value = index;
  }
}
