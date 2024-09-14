import 'package:attendance_app/data/datasources/local/office_local_data_sources.dart';
import 'package:attendance_app/data/datasources/local/user_local_data_sources.dart';
import 'package:attendance_app/data/repositories/office_repository_impl.dart';
import 'package:attendance_app/data/repositories/user_repository_impl.dart';
import 'package:attendance_app/domain/repositories/user_repository.dart';
import 'package:attendance_app/domain/usecases/office_usecases.dart';
import 'package:attendance_app/domain/usecases/user_usecases.dart';
import 'package:get/get.dart';

import '../domain/repositories/office_repository.dart';

class AppModule {
  static final AppModule _singleton = AppModule._internal();

  factory AppModule() {
    return _singleton;
  }

  AppModule._internal();

  configure() async {
    // data sources
    Get.lazyPut(() => UserLocalDataSource());
    Get.lazyPut(() => OfficeLocalDataSources());
    // repositories implementation
    Get.lazyPut(() => UserRepositoryImpl(userLocalDataSource: Get.find()));
    Get.lazyPut(() => OfficeRepositoryImpl(officeLocalDataSources: Get.find()));
    // repositories
    Get.lazyPut<UserRepository>(() => Get.find<UserRepositoryImpl>());
    Get.lazyPut<OfficeRepository>(() => Get.find<OfficeRepositoryImpl>());
    // use cases
    Get.lazyPut(() => UserUseCases(Get.find()));
    Get.lazyPut(() => OfficeUseCases(Get.find()));
  }
}
