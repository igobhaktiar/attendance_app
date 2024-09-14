import 'package:attendance_app/config/app_colors.dart';
import 'package:attendance_app/core/widget/button_primary_widget.dart';
import 'package:attendance_app/presentation/boarding/controller/boarding_controller.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../map/ui/map_view_widget.dart';

class MapLocationPage extends GetWidget<BoardingController> {
  const MapLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pilih Lokasi Kantor')),
      body: const MapViewWidget(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ButtonPrimaryWidget(
          onPressed: () =>  controller.saveLocation(),
          text: 'Simpan Lokasi',
          color: AppColors.primary,
          texColor: Colors.white,
          icon: const Icon(
            FluentSystemIcons.ic_fluent_checkmark_filled,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
