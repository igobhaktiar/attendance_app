import 'package:attendance_app/data/datasources/local/user_local_data_sources.dart';
import 'package:attendance_app/data/models/attendance_model.dart';
import 'package:attendance_app/data/models/user_model.dart';
import 'package:attendance_app/domain/entities/user.dart';
import 'package:attendance_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({required this.userLocalDataSource});

  @override
  Future<UserModel?> getUser() {
    return userLocalDataSource.getUser();
  }

  @override
  Future<void> saveUser(UserModel user) {
    return userLocalDataSource.saveUser(user);
  }

  @override
  Future<void> updateUserAttendance(String userId, AttendanceModel? newAttendance) {
    return userLocalDataSource.updateUserAttendance(userId, newAttendance);
  }
}
