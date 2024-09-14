import 'package:hive/hive.dart';

part 'attendance_model.g.dart';

@HiveType(typeId: 2)
class AttendanceModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String date;

  @HiveField(2)
  final String duration;

  @HiveField(3)
  final String checkIn;

  @HiveField(4)
  final String checkOut;

  @HiveField(5)
  final String status;

  AttendanceModel({
    required this.id,
    required this.date,
    required this.duration,
    required this.checkIn,
    required this.checkOut,
    required this.status,
  });
}
