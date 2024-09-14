import 'package:attendance_app/data/models/attendance_model.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final List<AttendanceModel>? attendances;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.attendances,
  });
}
