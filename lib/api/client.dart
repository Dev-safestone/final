import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:login/models/userProfileModel.dart';
import 'package:login/screens/background_location/background_location.dart';
import 'package:login/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:login/screens/cookies/apiToken.dart';
import 'package:login/screens/login/login_otp_screen.dart';
import 'package:login/screens/login/login_screen.dart';
import 'package:login/screens/onesignal/onesignal.dart';
import 'package:login/screens/opt%20code/otp_home_page.dart';
import 'package:login/screens/safe_circles/safe_circle.dart';
import 'package:login/screens/safe_circles/safecircle_id.dart';
import 'package:login/screens/signup_gmai/SessionData.dart';
import 'package:login/screens/signup_gmai/gmail_phone.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/searchModel.dart';
import '../screens/login/login_sessionid.dart';
import '../screens/signup_gmai/phone_number_signup.dart';
import '../utils/consts.dart';
import 'base.dart';

class MyApiClientServices extends MyApiServices {
  static MyApiClientServices shared = MyApiClientServices._internal();
  MyApiClientServices._internal() : super();

  /// ---SendOtp --[sendOtp]

  Future<void> sendPhoneNumberToServer() async {
    String phoneNumber = GmailPhoneSignupState.enteredPhoneNumber;

    print(phoneNumber);

    try {
      final response = await dio.post(
        '/auth-2factor/sendOtp',
        data: {
          'mobileNumber': phoneNumber,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;

        // Check if the response contains the "message" and "userDetails" fields
        if (responseData.containsKey('message') &&
            responseData.containsKey('userDetails')) {
          String message = responseData['message'];
          Map<String, dynamic> userDetails = responseData['userDetails'];

          // Extract session ID
          String? mySessionId = userDetails['sessionId'];

          if (mySessionId != null) {
            // Store the session ID in SessionData
            SessionData.sessionId = mySessionId;
            print('Session ID: $mySessionId'); // this is my sessiion id
          } else {
            // Handle the case where the session ID is null or not present
            print('Session ID is null or not present in the response.');
          }

          // Print the message and userDetails data
          print('Message: $message');
          print('User Details: $userDetails');

          // ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          //   SnackBar(
          //     content: Text('$message 🥳🥳🥳🥳.'),
          //   ),
          // );

          // You can use userDetails as needed here

          // Handle navigation or other tasks here

          Get.to(OtpHomePage(userDetails: userDetails));
        } else {
          // Handle the case where the response is missing expected fields
          print('Response does not contain expected fields.');
          // ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          //   SnackBar(
          //     content: Text('Unexpected response from the server.'),
          //   ),
          // );
        }
      } else {
        // Handle other status codes if needed
        print('Request failed with status: ${response.statusCode}');
        // ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        //   SnackBar(
        //     content: Text('Failed to send phone number. Please try again.😬😬'),
        //   ),
        // );
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
      {
        // Show an error message to the user
        // ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        //   SnackBar(
        //     content: Text('An error occurred. Please try again.'),
        //   ),
        // );
      }
    }
  }

//--------------------------phone number validation -------------------
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
      //Call the loginUser function
      //isPressed = true;
      //setState(() {});
      //loginUser();
      sendOtp();
    }
  }

  //sendotp

  Future<void> sendOtp() async {
    var number = EmailPasswordPhoneState.enteredPhoneNumber;

    int? callnumber = int.tryParse(number);
    print(callnumber.runtimeType);

    if (callnumber != null) {
      // Check if callnumber is not null
      // Create a Dio instance
      final dio = Dio();

      try {
        // Define the API endpoint URL
        print(EmailPasswordPhoneState.enteredPhoneNumber);
        var response = await dio.post(
          'http://3.7.74.242:3000/auth-2factor/sendOtp',
          data: {
            'mobileNumber': callnumber.toString(), // Convert to String
          },
        );

        // Check if the request was successful (you can adjust the status code as needed)
        if (response.statusCode == 200) {
          print(response.data);
          Get.to(() => LoginOtpHomePage(
                userDetails: {},
              ));

          final String jsonResponse = response.data.toString();
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('apiResponse', jsonResponse);

          // If the session ID is present in the response, store it in SharedPreferences
          if (response.data['userDetails'] != null &&
              response.data['userDetails']['sessionId'] != null) {
            final String sessionId = response.data['userDetails']['sessionId'];
            await prefs.setString('sessionId', sessionId);
          }

          // // Extract the session ID from the response (assuming it's in JSON format)
          // final sessionId = response.data['userDetails']['sessionId'];

          // // Store the session ID in the LoginSessionId class
          // LoginSessionId.sessionId = sessionId;

          // Store the session ID in SharedPreferences if needed
          // final prefs = await SharedPreferences.getInstance();
          // await prefs.setString('sessionId', sessionId);
          // print(sessionId);

          print(prefs.getString('sessionId'));
        } else {
          print('API request failed with status code: ${response.statusCode}');
          // Handle the error as needed
        }
      } catch (e) {
        print('Error making API request: $e');
        // Handle the error as needed
      }
    } else {
      // Handle the case where the number couldn't be parsed as an integer
      print('Invalid phone number');
      // You might want to display an error message to the user here
    }
  }

//--------------------------verify otp for login ------------------------------------

  Future<void> verifyotp() async {
    // Create a Dio instance
    final dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? playerId = await Preferences.getOnesignalUserId();
    String? sessionid = prefs.getString('sessionId');

    String? otp = prefs.getString('entered_otp');

    try {
      // Define the API endpoint URL
      print(otp);
      print(EmailPasswordPhoneState.enteredPhoneNumber);
      print(playerId);

      var response = await dio.post(
        'http://3.7.74.242:3000/auth-2factor/login',
        data: {
          'otp': otp,
          'MobileNumber': EmailPasswordPhoneState.enteredPhoneNumber,
          'SessionID': sessionid,
          'PlayerID': playerId, // Convert to String
        },
      );

      // Check if the request was successful (you can adjust the status code as needed)
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

        Get.to(() => NavigationPage());
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

  //--------------------------------------------------send otp for registeration--------------------------

  void checkPhoneNumberAndLoginUserRegistration(BuildContext context) {
    var phoneNumb = PhoneNumberSignupTextFieldState.phoneNumber;
    // converting number into integer
    if (phoneNumb.length < 10) {
      // Show an alert box with white text
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFF2974D),
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
      // registerUser();
      sendOtpRegistration();
    }
  }

  //----------------------------------send otp for registratio--------------------------------

  Future<void> sendOtpRegistration() async {
    var phoneNumb = PhoneNumberSignupTextFieldState.phoneNumber;
    final Dio dio = Dio();
    final String apiUrl =
        'http://3.7.74.242:3000/auth-2factor/sendOtp'; // Replace with your API endpoint

    // Replace '9980293862' with the actual mobile number
    final Map<String, dynamic> requestData = {
      "mobileNumber": phoneNumb,
    };

    try {
      print(phoneNumb);
      // Make the API call
      final response = await dio.post(apiUrl, data: requestData);

      if (response.statusCode == 200) {
        Get.to(() => OtpHomePage(userDetails: {}));
        print(response.data);
        //print(sessionId);
        // API call successful, store the response and session ID in SharedPreferences
        final String jsonResponse = response.data.toString();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('apiResponse', jsonResponse);

        // If the session ID is present in the response, store it in SharedPreferences
        if (response.data['userDetails'] != null &&
            response.data['userDetails']['sessionId'] != null) {
          final String sessionId = response.data['userDetails']['sessionId'];
          await prefs.setString('sessionId', sessionId);
        }

        if (response.statusCode == 409) {
          print('user already registered');
        }

        print('API response and session ID stored in SharedPreferences.');
        print(prefs.getString('sessionId'));
      } else {
        print('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error making API call: $e');
    }
  }

  //---------------------------------------------------------register user ---------------------


  Future<void> registeruser() async {
    //final String enteredPin;
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

    final Dio dio = Dio();
    String apiUrl = 'http://3.7.74.242:3000/auth-2factor/register';
    int? pn = int.tryParse(number);

    // Replace '9980293862' with the actual mobile number
    // final String mobileNumber = "9980293862";
    double? lat = LocationManager.latitude;
    double? long = LocationManager.longitude;
    try {
      // Retrieve the SessionID from SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? sessionId = prefs.getString('sessionId');
      final String? enteredpin = prefs.getString('entered_otp');

      if (sessionId != null) {
        final Map<String, dynamic> requestData = {
          "otp": enteredpin, // Replace with the actual OTP
          "SessionID": sessionId,
          "MobileNumber": pn,
          "name": name,
          "userId": userid,
          "gender": gender,
          "age": age,
          "city": city,
          "lat": latii,
          "long": longii,
          "address": address,
        };

        // Make the second API call
        print(enteredpin);
        print(sessionId);
        print(number);
        print(pn.runtimeType);
        final response = await dio.post(apiUrl, data: requestData);

        if (response.statusCode == 201) {
          print('API call for 2-factor authentication successful.');
          Get.to(() => UserProfile());
          print(response.data);
          // Handle the response as needed
          if (response.statusCode == 409) {
            print("user already exists");
          }
        } else {
          print(
              'API call for 2-factor authentication failed with status code: ${response.statusCode}');
          // Handle the error response
        }
      } else {
        print('Session ID not found in SharedPreferences.');
        // Handle the case where Session ID is not available
      }
    } catch (e) {
      print('Error making API call for 2-factor authentication: $e');
      // Handle any exceptions that may occur
    }
  }
  

  //----------------------------------------------create safe circle---------------------
  Future<void> createSafeCircle() async {
    var name = EditSafeCirclesState.storedSafecirclename;
    final dio = Dio();

    try {
      print(name);
      var response = await dio.post(
        'http://3.7.74.242:3000/safecircle/createSafeCircle',
        data: {
          "name":
              EditSafeCirclesState.storedSafecirclename, // Convert to String
        },
      );
      print(response.data);

      // Check if the request was successful (you can adjust the status code as needed)
      if (response.statusCode == 200) {
        // Extract the safeCircleId from the response
        SafeCircleId.safeCircleId = response.data['data']['safeCircleId'];

        // Print the extracted safeCircleId
        print('Safe Circle ID: ${SafeCircleId.safeCircleId}');
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

  Future<Search> getSearchSuggestions(
      String name, int page, int perPage) async {
    try {
      // var data = json.encode({
      //   "name": "$firstName $middleName $lastName",
      //   "department": department,
      //   "branch_id": branchId,
      //   "refId": refId,
      //   "password": password,
      //   "passwordConfirm": password,
      //   "email": email
      // });
      // var dio = Dio();
      var response = await dio.get(
          'http://3.7.74.242:3000/user/searchByName?name=$name&page=$page&users_per_page=$perPage');

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        return Search.fromJson(response.data);
      } else {
        print(response.statusMessage);
        return Search.fromJson(response.data);
      }
    } catch (error) {
      print(error);
      return Future.error(getException(error));
    }
  }

  Future<UserProfile> getuserProfileData(String id) async {
    try {
      // var data = json.encode({
      //   "name": "$firstName $middleName $lastName",
      //   "department": department,
      //   "branch_id": branchId,
      //   "refId": refId,
      //   "password": password,
      //   "passwordConfirm": password,
      //   "email": email
      // });
      // var dio = Dio();
      var response = await dio.get('http://3.7.74.242:3000/user/getuser/' + id);

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        return UserProfile.fromJson(response.data);
      } else {
        print(response.statusMessage);
        return UserProfile.fromJson(response.data);
      }
    } catch (error) {
      print(error);
      return Future.error(getException(error));
    }
  }

  updateUser(String lat, String long) async {
    try {
      // var data = json.encode({
      //   "name": "$firstName $middleName $lastName",
      //   "department": department,
      //   "branch_id": branchId,
      //   "refId": refId,
      //   "password": password,
      //   "passwordConfirm": password,
      //   "email": email
      // });
      // var dio = Dio();
      var response = await dio.put(
        'http://3.7.74.242:3000/user/updateUser',
        data: {
          'lat': lat,
          'long': long,
        },
      );
      print(response);
      if (response.statusCode == 200) {
        print(json.encode(response.data));
        // return UserProfile.fromJson(response.data);
      } else {
        print(response.statusMessage);
        // return UserProfile.fromJson(response.data);
      }
    } catch (error) {
      print(error);
      return Future.error(getException(error));
    }
  }

  Future updateUserLocation() async {
    late Position position;
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      // var data = json.encode({
      //   "name": "$firstName $middleName $lastName",
      //   "department": department,
      //   "branch_id": branchId,
      //   "refId": refId,
      //   "password": password,
      //   "passwordConfirm": password,
      //   "email": email
      // });
      // var dio = Dio();
      var response = await dio.put(
        'http://3.7.74.242:3000/user/updateUser',
        data: {
          'lat': position.latitude,
          'long': position.longitude,
        },
      );
      print(response);
      if (response.statusCode == 200) {
        print(json.encode(response.data));
        print("Updating loaction from work Manager Call");
        // return UserProfile.fromJson(response.data);
      } else {
        print(response.statusMessage);
        // return UserProfile.fromJson(response.data);
      }
    } catch (error) {
      print(error);
      return Future.error(getException(error));
    }
  }

  updatePlayerId() async {
    try {
      String? playerId = await Preferences.getOnesignalUserId();
      // var data = json.encode({
      //   "name": "$firstName $middleName $lastName",
      //   "department": department,
      //   "branch_id": branchId,
      //   "refId": refId,
      //   "password": password,
      //   "passwordConfirm": password,
      //   "email": email
      // });
      // var dio = Dio();
      var response = await dio.put(
        'http://3.7.74.242:3000/user/updateUser',
        data: {
          'playerId': playerId ?? "",
        },
      );
      print(response);
      if (response.statusCode == 200) {
        print(json.encode(response.data));
        // return UserProfile.fromJson(response.data);
      } else {
        print(response.statusMessage);
        return UserProfile.fromJson(response.data);
      }
    } catch (error) {
      print(error);
      //   return Future.error(getException(error));
    }
  }
}
