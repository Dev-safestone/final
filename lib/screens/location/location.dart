import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

String latitude = '';
String longitude = '';
late Position position;
Future<void> getLocation() async {
  // Check if the app has been granted permission to access location.
//  LocationPermission permission = await Geolocator.requestPermission();

  // If the permission has not been granted, prompt the user to grant it.
  // if (permission == LocationPermission.denied) {
  //   await Geolocator.openAppSettings();
  // }

  position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  latitude = position.latitude.toString();
  longitude = position.longitude.toString();

  // Store lati and longi in SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('lati', latitude);
  prefs.setString('longi', longitude);

  print('Latitude is $latitude');
  print('Longitude is $longitude');

  LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
    locationSettings: locationSettings,
  ).listen((Position position) {
    longitude = position.longitude.toString();
    latitude = position.latitude.toString();

    // Update and store updated lati and longi in SharedPreferences
    prefs.setString('lati', latitude);
    prefs.setString('longi', longitude);

    print('Updated Latitude is $latitude');
    print('Updated Longitude is $longitude');
  });
}
