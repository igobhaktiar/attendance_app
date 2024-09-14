import 'package:attendance_app/domain/usecases/office_usecases.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapViewController extends GetxController {
  final OfficeUseCases _officeUseCase = Get.find<OfficeUseCases>();

  final Rx<LatLng?> currentLocation = Rx<LatLng?>(null);
  final RxBool isLocationLoading = RxBool(true);
  final Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  final Rx<LatLng?> _officeLocation = Rx<LatLng?>(null);
  final officeRadius = 100.0.obs;
  var isSelectingLocation = false.obs;
  final isOfficeSet = false.obs;
  final _isUserInOffice = false.obs;

  LatLng? get selectedLocationValue => selectedLocation.value;

  LatLng get officeLocation => _officeLocation.value ?? const LatLng(0, 0);

  bool get getOfficeSet => isOfficeSet.value;

  bool get isUserInOffice => _isUserInOffice.value;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw 'Layanan lokasi tidak aktif.';
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Izin lokasi ditolak.';
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw 'Izin lokasi ditolak secara permanen.';
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      currentLocation.value = LatLng(position.latitude, position.longitude);
      _getOfficeLocation();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLocationLoading.value = false;
    }
  }

  void _getOfficeLocation() async {
    var office = await _officeUseCase.getOfficeLocation();
    if (office != null) {
      isOfficeSet.value = true;
      _officeLocation.value = LatLng(office.latitude, office.longitude);
      _checkUserInOffice();
    }
  }

  void _checkUserInOffice() async {
    // Collect multiple distance readings
    List<double> distanceReadings = [];
    for (int i = 0; i < 5; i++) {
      double distance = Geolocator.distanceBetween(
          currentLocation.value!.latitude,
          currentLocation.value!.longitude,
          officeLocation.latitude,
          officeLocation.longitude);
      distanceReadings.add(distance);
      await Future.delayed(
          const Duration(milliseconds: 500)); // Delay for stability
    }

    // Get the average distance
    double averageDistance =
        distanceReadings.reduce((a, b) => a + b) / distanceReadings.length;

    // Check if user is within the office radius
    if (averageDistance <= officeRadius.value) {
      _isUserInOffice.value = true;
    } else {
      _isUserInOffice.value = false;
    }
  }
}
