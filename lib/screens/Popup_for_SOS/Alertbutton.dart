import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/screens/cookies/apiToken.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sospopup_final.dart'; // Import the PopupContent widget

class AlertPopupButton extends StatelessWidget {
  AlertPopupButton({super.key});

  String uid = '64ee3f50b76da26a55fbbe30';

  //String lat = "21322";
  //String long = "435465465";
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
          onPressed: () {
            //Get.to(() => PopupContent());
            sendSOSAlert(); // Navigate to PopupContent widget
          },
          child: Text(
            'Alert',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w400,
              height: 1.12,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sendSOSAlert() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var lati = prefs.getString('lati') ?? '';
    var longi = prefs.getString('longi') ?? '';

    try {
      final dio = Dio();

      // Get the access token from your ApiTokens class
      String? accessToken = ApiTokens.getAccessToken();

      // Check if the access token is available
      if (accessToken == null) {
        print('Access token is not available. Make sure to obtain it.');
        return;
      }

      // Set the headers including the "Authorization" header with the access token
      Map<String, dynamic> headers = {
        'Cookie': 'access_token=$accessToken',
        // Add any other headers you need here
      };
      print('access token is $accessToken');
      var response = await dio.request(
        'http://3.7.74.242:3000/user/sendSosAlert',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: {
          "userId": uid, // Replace with the actual user ID
          "lat": lati, // Replace with the user's latitude
          "long": longi,
        },
      );

      // Print the entire response content
      print('Response: ${response.data}');

      if (response.statusCode == 200) {
        // Successful response
        print('Request successful');

        // Check the response data for the "message" field
        var responseData = response.data;
        String message = responseData['message'];

        // Print the message
        print('Message: $message');

        // If needed, you can also access other fields like "nearbyUsers"
        var nearbyUsers = responseData['nearbyUsers'];
        print('Nearby Users: $nearbyUsers');
        Get.to(() => PopupContent());

        // Navigate to another page or perform further actions if necessary
      } else {
        // Handle other status codes
        print('Request failed with status: ${response.statusCode}');
        print('Error response: ${response.data}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e.');
    }
  }
}
