import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:login/api/client.dart';
import 'package:login/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:login/screens/bottom_nav_bar/home_widget.dart';
import 'package:login/screens/cookies/apiToken.dart';
import 'package:login/screens/login/login_screen.dart';
import 'package:login/screens/login/login_sessionid.dart';
import 'package:login/screens/onesignal/onesignal.dart';
import 'package:login/screens/signup_gmai/gmail_phone.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginOtpVerifyButton extends StatelessWidget {
  final String enteredPin;
  final Dio dioInstance = Dio(); // Declare dioInstance here
  //String mySessionId = SessionData.sessionId!;

  //for time being session id can be anything

  String number = GmailPhoneSignupState.enteredPhoneNumber;

  String lati = '';
  String longi = '';
  late Position position;
  String name = 'dummy';
  String age = '20';
  String userid = '1244';
  String gender = 'male';
  String address = 'cvxgfgdfgdfgdfg';
  String city = 'snfdsjddf';
  String latii = '19.0760';
  String longii = '72.8777';

  //Image myImage = Image.asset('assets/images/welcome image.jpg');

  Future<void> getLocation() async {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    longi = position.longitude.toString();
    lati = position.latitude.toString();

    print('Latitude is $lati');
    print('Longitude is $longi');
  }

  LoginOtpVerifyButton(this.enteredPin);

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
              //verifyotp();
              MyApiClientServices.shared.verifyotp();
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
