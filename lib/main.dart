import 'package:attendance_app/config/app_routes.dart';
import 'package:attendance_app/data/models/office_model.dart';
import 'package:attendance_app/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'config/app_module.dart';
import 'presentation/boarding/binding/boarding_binding.dart';

void main() async {
  final appModule = AppModule();

  await appModule.configure();

  // hive
  await Hive.initFlutter();
  Hive.registerAdapter(OfficeLocationModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('user-data');
  await Hive.openBox<OfficeLocationModel>('office');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.splash,
      initialBinding: BoardingBinding(),
      getPages: AppRoutes.pages,
    );
  }
}
