import 'package:attendance_app/domain/usecases/office_usecases.dart';
import 'package:attendance_app/domain/usecases/user_usecases.dart';
import 'package:attendance_app/presentation/home/widget/check_in_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _userUseCase = Get.find<UserUseCases>();
  final _officeUseCase = Get.find<OfficeUseCases>();

  final _currentTime = '00:00'.obs;
  final _currentDate = 'Monday, 01 January 2021'.obs;
  final _amPm = 'AM'.obs;
  final _fullName = ''.obs;
  final _officeName = ''.obs;
  final _officeAddress = ''.obs;

  String get currentTime => _currentTime.value;

  String get currentDate => _currentDate.value;

  String get amPm => _amPm.value;

  String get fullName => _fullName.value;

  String get officeName => _officeName.value;

  String get officeAddress => _officeAddress.value;

  @override
  void onInit() {
    super.onInit();
    _updateTime();
    _getUser();
    _getOffice();
  }

  void _getUser() async {
    var user = await _userUseCase.getUser();

    if (user != null) {
      _fullName.value = user.name;
    }
  }

  void _getOffice() async {
    var office = await _officeUseCase.getOfficeLocation();

    if (office != null) {
      _officeName.value = office.name;
      _officeAddress.value = office.address;
    }
  }

  void onPressCheckIn() {
    Get.dialog(
      const CheckInDialogWidget(),
    );
  }

  void _updateTime() {
    _currentTime.value =
        '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}';
    _currentDate.value = _formatDate(DateTime.now());
    _amPm.value = DateTime.now().hour >= 12 ? 'PM' : 'AM';
    Future.delayed(const Duration(seconds: 1), _updateTime);
  }

  // format date to 'Monday, 01 January 2021'
  String _formatDate(DateTime date) {
    return '${_getDay(date.weekday)}, ${date.day.toString().padLeft(2, '0')} ${_getMonth(date.month)} ${date.year}';
  }

  String _getDay(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}