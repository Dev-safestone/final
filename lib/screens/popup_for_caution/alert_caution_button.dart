import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/screens/popup_for_caution/caution_mode_final.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login/screens/popup_for_caution/location_fetching.dart';

import '../../api/client.dart';

// Import the PopupContent widget

class AlertCautionPopupButton extends StatefulWidget {
  const AlertCautionPopupButton({super.key});

  @override
  State<AlertCautionPopupButton> createState() =>
      _AlertCautionPopupButtonState();
}

class _AlertCautionPopupButtonState extends State<AlertCautionPopupButton> {
  String lati = '';
  String longi = '';
  late Position position;
  final Dio dioInstance = Dio();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 32,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFEF8329),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            minimumSize: Size(100, 32),
          ),
          onPressed: () async {
            //LocationFetchLogicState();
            await getLocation();

            // Once the location is fetched, make the API call.
            // await sendLatAndLong();
            await MyApiClientServices.shared.updateUser(lati, longi);
            Get.back();

            //Get.to(
            // () => CautionPopupContent()); // Navigate to PopupContent widget
          },
          child: Text(
            'Alert',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.12,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getLocation() async {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    longi = position.longitude.toString();
    lati = position.latitude.toString();

    print('Latitude is $lati');
    print('Longitude is $longi');

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen((Position position) {
      longi = position.longitude.toString();
      lati = position.latitude.toString();

      print('Updated Latitude is $lati');
      print('Updated Longitude is $longi');
    });
  }

  Future<void> sendLatAndLong() async {
    // Dio dio = Dio(); // Create an instance of Dio

    try {
      print('passing longitide in apicall try block $longi');
      print('passing latitude in apicall try block $lati');
      var dioResponse = await dioInstance.put(
        'http://3.7.74.242:3000/user/updateUser', // Replace with your API endpoint
        data: {
          'lat': lati,
          'long': longi,
        },
      );

      if (dioResponse.statusCode == 200) {
        print('Request success with status: ${dioResponse.statusCode}');
      } else {
        // Handle other status codes if needed
        print('Request failed with status: ${dioResponse.statusCode}');
        // Show an error message to the user
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
      // Show an error message to the user
    }
  }
}
