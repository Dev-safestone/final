import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:login/api/client.dart';
import 'package:login/screens/background_location/background_location.dart';
import 'package:login/screens/bottom_nav_bar/home_widget.dart';
import 'package:login/screens/signup_gmai/gmail_phone.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:dio/dio.dart' as dio; // Import dio with a prefix

import 'package:login/screens/user_profile/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../signup_gmai/SessionData.dart';

class VerifyButton extends StatelessWidget {
  //Image myImage = Image.asset('assets/images/welcome image.jpg');
  final String enteredPin;
  // Future<void> getLocation() async {
  //   position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );

  //   longi = position.longitude.toString();
  //   lati = position.latitude.toString();

  //   print('Latitude is $lati');
  //   print('Longitude is $longi');
  // }

  VerifyButton(this.enteredPin);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Center(
        child: Container(
          width: 302,
          height: 53.20,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFF2974D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              MyApiClientServices.shared.registeruser();
              // Get.to(() => UserProfile());
              //getLocation();
              // Future.delayed(Duration(seconds: 20), () {
            
              // });
            },
            child: Text(
              'Verify',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Avenir',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
