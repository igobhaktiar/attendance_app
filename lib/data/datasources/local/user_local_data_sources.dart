import 'package:attendance_app/data/models/user_model.dart';
import 'package:hive/hive.dart';

class UserLocalDataSource {
  final Box<UserModel> _userBox = Hive.box<UserModel>('user-data');

  Future<void> saveUser(UserModel user) async {
    await _userBox.put('user-data', user);
  }

  Future<UserModel?> getUser() async {
    return _userBox.get('user-data');
  }
}
