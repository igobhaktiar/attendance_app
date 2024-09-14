import 'package:attendance_app/data/models/office_model.dart';
import 'package:hive_flutter/adapters.dart';

class OfficeLocalDataSources {
  final Box<OfficeLocationModel> _officeBox =
      Hive.box<OfficeLocationModel>('office');

  Future<void> saveOfficeLocation(OfficeLocationModel location) async {
    await _officeBox.put('office', location);
  }

  Future<OfficeLocationModel?> getOfficeLocation() async {
    return _officeBox.get('office');
  }
}
