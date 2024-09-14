import 'package:attendance_app/data/models/attendance_model.dart';
import 'package:attendance_app/data/models/user_model.dart';
import 'package:attendance_app/domain/repositories/user_repository.dart';

class UserUseCases {
  final UserRepository userRepository;

  UserUseCases(this.userRepository);

  Future<UserModel?> getUser() async {
    return userRepository.getUser();
  }

  Future<void> saveUser(UserModel user) async {
    return userRepository.saveUser(user);
  }

  Future<void> updateUserAttendance(
      String userId, AttendanceModel? newAttendance) async {
    return userRepository.updateUserAttendance(userId, newAttendance);
  }
}
