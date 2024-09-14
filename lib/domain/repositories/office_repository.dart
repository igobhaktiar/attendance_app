import 'package:attendance_app/domain/entities/office_location.dart';

abstract class OfficeRepository {
  Future<void> saveOfficeLocation(OfficeLocation location);

  Future<OfficeLocation?> getOfficeLocation();
}
