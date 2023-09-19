import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:login/api/client.dart';
import 'package:login/screens/background_location/background_location.dart';
//import 'package:get/get.dart';
import 'package:login/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:login/screens/bottom_nav_bar/home_widget.dart';
import 'package:login/screens/cookies/apiToken.dart';
import 'package:login/screens/onesignal/onesignal.dart';
import 'package:login/screens/signup_gmai/gmail_phone.dart';
import 'package:login/screens/user_profile/user_profile.dart';
import 'package:login/utils/SharePrefs.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SaveChangesButton extends StatelessWidget {
  final bool agreeToTerms;
  var phone = GmailPhoneSignupState.enteredPhoneNumber;

  // String otp = '5555';

  // var sessionId = '987654321';

  SaveChangesButton({required this.agreeToTerms});

  Future<void> uploadChanges(BuildContext context) async {
    var latitiude = LocationManager.latitude;
    var longitude = LocationManager.longitude;
    var name = UserProfileState.storedName;
    var uid = UserProfileState.storedUserId;
    var cityy = UserProfileState.storedCity;
    var agee = UserProfileState.storedAge;
    var gender = UserProfileState.storedGender;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = ApiTokens.getAccessToken();
    String? playerId = await Preferences.getOnesignalUserId();

    if (accessToken == null) {
      print('Access token not found.');
      return;
    }

    String imagePath = prefs.getString('user_image') ?? '';

    if (imagePath.isEmpty) {
      print('No image selected.');
      return;
    }

    // Set your API endpoint URL
    String apiUrl = 'http://3.7.74.242:3000/user/updateUser';

    // Set your headers, including the access token
    Map<String, String> headers = {
      'Cookie': 'access_token=$accessToken',
    };

    try {
      print('acces token for update user is $accessToken');
      print('image path for update user is $imagePath');
      print('player id for update is $playerId');
      print('age for update is $agee');
      print(agee.runtimeType);
      print('user id $uid');
      print('user stored name is $name');
      print(cityy);
      print(gender);

      var dio = Dio();

      // Create a FormData object with the image file and other fields
      var formData = FormData();
      formData.files.add(
        MapEntry(
          'file',
          await MultipartFile.fromFile(
            imagePath,
            filename: imagePath.split('/').last,
          ),
        ),
      );

      // Add other fields to the formData object
      formData.fields.addAll([
        // MapEntry('lat', latitiude.toString()),
        //MapEntry('long', longitude.toString()),
        MapEntry('playerId', playerId ?? ''),
        MapEntry('name', name!),
        MapEntry('userId', uid!),
        MapEntry('gender', gender!),
        MapEntry('age', agee!),
        MapEntry('city', cityy!),
        // Add other fields as needed
      ]);

      var response = await dio.put(
        apiUrl,
        data: formData, // Use formData directly as the data field
        options: Options(
          headers: headers,
        ),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        Navigator.of(context as BuildContext).push(
          MaterialPageRoute(
            builder: (context) => NavigationPage(),
          ),
        );
        // Handle successful response
      } else {
        print(response.statusMessage); // Handle error response
      }
    } catch (e) {
      print('Error: $e'); // Handle network or other errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: agreeToTerms,
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Center(
          child: Container(
            width: 228.70,
            height: 53.20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF2974D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                loginUser(context);
                // Navigator.of(context as BuildContext).push(
                //   MaterialPageRoute(
                //     builder: (context) => NavigationPage(),
                //   ),
                // );

                // Call the API when the button is pressed
              },
              child: Text(
                'Save changes',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? sessionId = prefs.getString('sessionId');
    final enetredpin = prefs.getString('entered_otp');
    Dio dio = Dio();

    try {
      print(phone);
      print(sessionId);
      print(enetredpin);
      String? playerId = await Preferences.getOnesignalUserId();
      print(playerId);
      var response = await dio.post(
        'http://3.7.74.242:3000/auth-2factor/login',
        data: {
          'MobileNumber': phone, //GmailPhoneSignupState.enteredPhoneNumber,
          'otp': enetredpin,
          'SessionID': sessionId,
          'PlayerID': playerId,
        },
      );

      if (response.statusCode == 200) {
        String? accessToken = extractAccessTokenFromHeaders(response.headers);

        // Store the access token in the ApiTokens class
        ApiTokens.setAccessToken(accessToken!);
        // Extract the user ID (_id) from the response
        String userId = response.data['data']['_id'];

        // Store the user ID (userId) in SharedPreferences
        prefs.setString('userId', userId);
        print(prefs.getString('userId'));
        print(ApiTokens.accessToken);

        uploadChanges(context);

        // Request was successful, you can handle the response data here
        print('API request successful');
        print(response.data);
      } else {
        // Handle other status codes if needed
        print('API request failed with status code: ${response.statusCode}');
        print('Error response: ${response.data}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error making API request: $e');
    }
  }
} // uploadChanges(context);
