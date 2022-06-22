import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../utils/utils.dart';

class LocationController extends GetxController {
  RxString city = cities[0].obs;
  RxBool isLocating = false.obs;
  static LocationController instance = Get.find();

  @override
  void onReady() {
    super.onReady();
    getLocation();
  }

  Future<void> getLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    setIsLocating(false);


    //check if the location service enabled or not
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    //check if the location permission is granted or not
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setIsLocating(true);

    _locationData = await location.getLocation();

    var address = await geo.GeocodingPlatform.instance.placemarkFromCoordinates(
      _locationData.latitude!,
      _locationData.longitude!,
    );
    setIsLocating(false);
    setCity(address[0].locality!);
  }

  setCity(String myCity) {
    city = myCity.obs;
    update();
  }

  setIsLocating(bool value) {
    isLocating = value.obs;
    update();
  }
}
