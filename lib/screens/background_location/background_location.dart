import 'package:location/location.dart';

import '../../api/client.dart';

class LocationManager {
  final Location _location = Location();
  static double? latitude; // Static variable to store latitude
  static double? longitude; // Static variable to store longitude

  Future<void> fetchLocationInBackground() async {
    try {
      final permissionStatus = await _location.hasPermission();

      if (permissionStatus == PermissionStatus.denied) {
        final newPermissionStatus = await _location.requestPermission();
        print("Location Permission Granted: $newPermissionStatus");
      } else {
        print("Location Permission Granted: $permissionStatus");
      }

      await _location.changeSettings(
        accuracy: LocationAccuracy.high,
        interval: 5000, // Fetch location every 5 seconds
      );
      _location.enableBackgroundMode();
      _location.onLocationChanged.listen((LocationData currentLocation) async {
        print(
            "Location: Latitude ${currentLocation.latitude}, Longitude ${currentLocation.longitude}");

        // Update static latitude and longitude variables with new location data
        latitude = currentLocation.latitude;
        longitude = currentLocation.longitude;

        await MyApiClientServices.shared
            .updateUser(latitude.toString(), longitude.toString());
      });
    } catch (e) {
      print("Error fetching location: $e");
    }
  }
}
