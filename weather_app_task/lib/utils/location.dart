import 'package:geolocator/geolocator.dart';

class Location {
  late double lat;
  late double lon;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      throw ('Something is wrong $e');
    }
  }
}
