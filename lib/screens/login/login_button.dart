import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:login/screens/cookies/apiToken.dart';
import 'package:login/screens/login/login_otp_screen.dart';
import 'package:login/screens/login/login_screen.dart';
import 'package:login/screens/onesignal/onesignal.dart';
import 'package:login/screens/opt%20code/otp_home_page.dart';
import 'package:login/utils/SharePrefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/client.dart';
import '../../utils/consts.dart';
import '../signup_gmai/phone_number_signup.dart';
import 'login_otp.dart';
import 'login_sessionid.dart';

class LoginButton extends StatefulWidget {
  LoginButton({super.key, required});

  @override
  State<LoginButton> createState() => LoginButtonState();
}

class LoginButtonState extends State<LoginButton> {
  var phone = EmailPasswordPhoneState.enteredPhoneNumber;

  var otp = '5555';

  var sessionId = '';

  // var playerId = '325c1113-0aff-40d4-9b10-c8a5b6a11a97';

  bool isPressed = false;

  void checkPhoneNumberAndLoginUser(BuildContext context) {
    if (EmailPasswordPhoneState.enteredPhoneNumber.length < 10) {
      print(EmailPasswordPhoneState.enteredPhoneNumber);
      // Show an alert box with white text
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: primaryColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: const Text(
              'Invalid Phone Number',
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            content: const Text(
              'Phone number cannot be less than 10 digits.',
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'OK',
                  style:
                      TextStyle(color: Colors.white), // Set text color to white
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert box
                },
              ),
            ],
          );
        },
      );
    } else {
      // Call the loginUser function
      // isPressed = true;
      // setState(() {});
      //loginUser();

      MyApiClientServices.shared.sendOtp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isPressed
          ? Container(
              width: 228.70,
              height: 53.20,
              child: Center(
                child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    )),
              ),
            )
          : Container(
              width: 228.70,
              height: 53.20,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  MyApiClientServices.shared.checkPhoneNumberAndLoginUser(
                      context); //checkPhoneNumberAndLoginUser(context);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
    );
  }

//   Future<void> sendOtp() async {
//     var number = EmailPasswordPhoneState.enteredPhoneNumber;

//     int? callnumber = int.tryParse(number);
//     print(callnumber.runtimeType);

//     if (callnumber != null) {
//       // Check if callnumber is not null
//       // Create a Dio instance
//       final dio = Dio();

//       try {
//         // Define the API endpoint URL
//         print(EmailPasswordPhoneState.enteredPhoneNumber);
//         var response = await dio.post(
//           'http://3.7.74.242:3000/auth-2factor/sendOtp',
//           data: {
//             'mobileNumber': callnumber.toString(), // Convert to String
//           },
//         );

//         // Check if the request was successful (you can adjust the status code as needed)
//         if (response.statusCode == 200) {
//           print(response.data);
//           Get.to(() => LoginOtpHomePage(
//                 userDetails: {},
//               ));

//           // Extract the session ID from the response (assuming it's in JSON format)
//           final sessionId = response.data['userDetails']['sessionId'];

//           // Store the session ID in the LoginSessionId class
//           LoginSessionId.sessionId = sessionId;

//           // Store the session ID in SharedPreferences if needed
//           // final prefs = await SharedPreferences.getInstance();
//           // await prefs.setString('sessionId', sessionId);
//           // print(sessionId);

//           print('Session ID stored successfully: $sessionId');
//         } else {
//           print('API request failed with status code: ${response.statusCode}');
//           // Handle the error as needed
//         }
//       } catch (e) {
//         print('Error making API request: $e');
//         // Handle the error as needed
//       }
//     } else {
//       // Handle the case where the number couldn't be parsed as an integer
//       print('Invalid phone number');
//       // You might want to display an error message to the user here
//     }
//   }

}
