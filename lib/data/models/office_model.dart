import 'package:attendance_app/domain/entities/office_location.dart';
import 'package:hive/hive.dart';

part 'office_model.g.dart';

@HiveType(typeId: 0)
class OfficeLocationModel extends OfficeLocation {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String address;
  @HiveField(2)
  final double latitude;
  @HiveField(3)
  final double longitude;

  OfficeLocationModel({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  }) : super(
            name: name,
            address: address,
            latitude: latitude,
            longitude: longitude);

  factory OfficeLocationModel.fromEntity(OfficeLocation location) {
    return OfficeLocationModel(
      name: location.name,
      address: location.address,
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }
}
