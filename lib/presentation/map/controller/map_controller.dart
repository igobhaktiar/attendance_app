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
  final _isOfficeSet = false.obs;

  LatLng? get selectedLocationValue => selectedLocation.value;

  LatLng get officeLocation => _officeLocation.value!;

  bool get isOfficeSet => _isOfficeSet.value;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
    _getOfficeLocation();
  }

  void _getOfficeLocation() async {
    var office = await _officeUseCase.getOfficeLocation();
    if (office != null) {
      _isOfficeSet.value = true;
      _officeLocation.value = LatLng(office.latitude, office.longitude);
    }
  }

  bool isWithinOfficeRadius(LatLng point) {
    if (_officeLocation.value == null) return false;
    final distance =
        const Distance().as(LengthUnit.Meter, _officeLocation.value!, point);
    return distance <= officeRadius.value;
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
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLocationLoading.value = false;
    }
  }
}
