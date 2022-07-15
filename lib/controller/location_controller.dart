import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LocationController extends GetxController {
  var lat = 0.0.obs;
  var long = 0.0.obs;
  var address = Placemark().obs;

  Future getPermitLoc() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Geolocator.getCurrentPosition().then((value) {
      getAddress(value.latitude, value.longitude);
      lat(value.latitude);
      long(value.longitude);
    });
  }

  Future getAddress(double lat, double long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    address(placemarks[0]);
  }

  @override
  void onInit() {
    // TODO: implement onInit

    getPermitLoc();
    super.onInit();
  }
}
