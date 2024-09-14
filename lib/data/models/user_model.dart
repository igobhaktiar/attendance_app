import 'package:attendance_app/domain/entities/user.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends User {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final bool? isPresent;


  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.isPresent,
  }) : super(id: id, name: name, email: email, isPresent: isPresent);
}
