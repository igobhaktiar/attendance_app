import 'package:attendance_app/data/datasources/local/office_local_data_sources.dart';
import 'package:attendance_app/data/models/office_model.dart';
import 'package:attendance_app/domain/repositories/office_repository.dart';
import '../../domain/entities/office_location.dart';

class OfficeRepositoryImpl extends OfficeRepository {
  final OfficeLocalDataSources officeLocalDataSources;

  OfficeRepositoryImpl({required this.officeLocalDataSources});

  @override
  Future<void> saveOfficeLocation(OfficeLocation location) async {
    final model = OfficeLocationModel.fromEntity(location);
    await officeLocalDataSources.saveOfficeLocation(model);
  }

  @override
  Future<OfficeLocation?> getOfficeLocation() async {
    final model = await officeLocalDataSources.getOfficeLocation();
    return model;
  }
}
