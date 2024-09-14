import 'package:attendance_app/presentation/map/controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapViewWidget extends GetWidget<MapViewController> {
  const MapViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLocationLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.currentLocation.value == null) {
        return const Center(
            child: Text('Tidak dapat mendapatkan lokasi saat ini'));
      } else {
        return FlutterMap(
          options: MapOptions(
            initialCenter: controller.currentLocation.value!,
            initialZoom: 15.0,
            onTap: (tapPosition, point) {
              if (controller.getOfficeSet == false) {
                controller.selectedLocation.value = point;
                controller.isSelectingLocation.value = true;
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
            ),
            if (controller.getOfficeSet)
              Obx(() {
                controller.getCurrentLocation();
                return CircleLayer(
                  circles: [
                    CircleMarker(
                      point: controller.officeLocation,
                      radius: controller.officeRadius.value,
                      color: controller.isUserInOffice
                          ? Colors.blue.withOpacity(0.3)
                          : Colors.red.withOpacity(0.3),
                      borderColor:
                          controller.isUserInOffice ? Colors.blue : Colors.red,
                      borderStrokeWidth: 2,
                    ),
                  ],
                );
              }),
            CurrentLocationLayer(
              alignPositionOnUpdate: AlignOnUpdate.once,
              alignDirectionOnUpdate: AlignOnUpdate.never,
            ),
            MarkerLayer(
              markers: [
                if (controller.isSelectingLocation.value &&
                    controller.selectedLocation.value != null)
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point:
                        controller.selectedLocation.value ?? const LatLng(0, 0),
                    child: const Icon(
                      Icons.location_on,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                if (controller.getOfficeSet)
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: controller.officeLocation,
                    child: const Icon(
                      Icons.location_on,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          ],
        );
      }
    });
  }
}
