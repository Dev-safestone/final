import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationFetchLogic extends StatefulWidget {
  const LocationFetchLogic({super.key});

  @override
  LocationFetchLogicState createState() => LocationFetchLogicState();
}

class LocationFetchLogicState extends State<LocationFetchLogic> {
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  static String lati = "";

  static String longi = "";
  
  @override
  void initState() {
    super.initState();
    checkGps();
  }

  @override
  Widget build(BuildContext context) {
    // You can return a widget here if needed
    return Container();
  }

  Future<void> checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print('Location permissions are permanently denied');
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        getLocation();
      }
    } else {
      print('GPS Service is not enabled, turn on GPS location');
    }
  }

  Future<void> getLocation() async {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
 lati = position.latitude.toString();
    longi = position.longitude.toString();
   

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

 
}
