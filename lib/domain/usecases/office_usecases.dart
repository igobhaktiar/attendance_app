import 'package:attendance_app/domain/entities/office_location.dart';
import 'package:attendance_app/domain/repositories/office_repository.dart';

class OfficeUseCases {
  final OfficeRepository _officeRepository;

  OfficeUseCases(this._officeRepository);


  Future<void> saveOfficeLocation(OfficeLocation location) async {
    return _officeRepository.saveOfficeLocation(location);
  }

  Future<OfficeLocation?> getOfficeLocation() async {
    return _officeRepository.getOfficeLocation();
  }
}