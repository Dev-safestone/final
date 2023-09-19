// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:login/screens/googleMaps/bottom_container.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;
  Location _location = Location();
  LatLng _currentLocation = const LatLng(13.2596238, 74.988062);
  String _mapStyle = ""; // Default location (Dubai)

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          child: Transform(
            transform: Matrix4.translationValues(0, 30, 10),
            child: GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _currentLocation,
                zoom: 8,
              ),
              onMapCreated: (controller) {
                mapController = controller;
                mapController.setMapStyle(_mapStyle);
              },
              markers: {
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: _currentLocation,
                  infoWindow: const InfoWindow(
                    title: "Current Location",
                    snippet: 'This is your current location',
                  ),
                ),
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Transform(
            transform: Matrix4.translationValues(0, 0, 10),
            child:
                // Empty container to take the full height above the BottomContainer
                BottomContainer(),
          ),
        ),
      ],
    );
  }

  _getCurrentLocation() async {
    LocationData locationData;
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location services are enabled
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check if location permission is granted
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Get the current location
    locationData = await _location.getLocation();
    setState(() {
      _currentLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
    });

    // Move the camera to the current location
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentLocation,
          zoom: 16.0,
        ),
      ),
    );
  }
}
