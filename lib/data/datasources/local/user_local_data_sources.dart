import 'package:attendance_app/data/models/attendance_model.dart';
import 'package:attendance_app/data/models/user_model.dart';
import 'package:hive/hive.dart';

class UserLocalDataSource {
  final Box<UserModel> _userBox = Hive.box<UserModel>('user');

  Future<void> saveUser(UserModel user) async {
    await _userBox.put('user', user);
  }

  Future<UserModel?> getUser() async {
    return _userBox.get('user');
  }

  Future<void> updateUserAttendance(
      String userId, AttendanceModel? newAttendance) async {
    UserModel? user = _userBox.get(userId);
    if (user != null) {
      user.attendances?.add(newAttendance!);
      await _userBox.put(userId, user);
    }
  }
}
