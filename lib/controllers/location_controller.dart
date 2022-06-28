import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:location/location.dart';
import '../controllers/controllers.dart';
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
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;
    setIsLocating(false);


    //check if the location service enabled or not
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    //check if the location permission is granted or not
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setIsLocating(true);

    locationData = await location.getLocation();

    var address = await geo.GeocodingPlatform.instance.placemarkFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );
    setIsLocating(false);
    setCity(address[0].locality!);
  }

  setCity(String myCity) async{
    city = myCity.obs;
    await SharedPrefController.storeLocation(myCity);
    update();
  }

  setIsLocating(bool value) {
    isLocating = value.obs;
    update();
  }
}
