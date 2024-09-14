import 'package:attendance_app/data/models/user_model.dart';
import 'package:attendance_app/domain/entities/user.dart';

abstract class UserRepository {
  Future<void> saveUser(UserModel user);

  Future<UserModel?> getUser();
}
