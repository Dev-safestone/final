// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/login/phone_number.dart';
import 'package:login/screens/opt%20code/otp_home_page.dart';
import 'package:login/screens/signup_gmai/continue_button.dart';
import 'package:login/screens/signup_gmai/gmail_button.dart';
import 'SessionData.dart';

import 'phone_number_signup.dart';

class GmailPhoneSignup extends StatefulWidget {
  // Corrected class name
  @override
  GmailPhoneSignupState createState() => GmailPhoneSignupState();

  sendPhoneNumberToServer() {}
}

class GmailPhoneSignupState extends State<GmailPhoneSignup> { // contains phone number of signup textfield
  static String enteredPhoneNumber = ''; // Initialize with an empty string

  void updatePhoneNumber(String newPhoneNumber) {
    setState(() {
      enteredPhoneNumber =
          newPhoneNumber; // Update the enteredPhoneNumber variable
    });
  }

//  Future<void> sendPhoneNumberToServer() async {
//   Dio dio = Dio();
//   print(enteredPhoneNumber);

//   try {
//     Response response = await dio.post(
//       'http://3.7.74.242:3000/auth-2factor/sendOtp',
//       data: {
//         'mobileNumber': enteredPhoneNumber,
//       },
//     );

//     if (response.statusCode == 200) {
//       Map<String, dynamic> responseData = response.data;

//       // Check if the response contains the "message" and "userDetails" fields
//       if (responseData.containsKey('message') &&
//           responseData.containsKey('userDetails')) {
//         String message = responseData['message'];
//         Map<String, dynamic> userDetails = responseData['userDetails'];

//         // Extract session ID
//         String? mySessionId = userDetails['sessionId'];

//         if (mySessionId != null) {
//           // Store the session ID in SessionData
//           SessionData.sessionId = mySessionId;
//            print('Session ID: $mySessionId');// this is my sessiion id
//         } else {
//           // Handle the case where the session ID is null or not present
//           print('Session ID is null or not present in the response.');
//         }

//         // Print the message and userDetails data
//         print('Message: $message');
//         print('User Details: $userDetails');

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('$message 🥳🥳🥳🥳.'),
//           ),
//         );

//         // You can use userDetails as needed here

//         // Handle navigation or other tasks here
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => OtpHomePage(userDetails: userDetails),
//           ),
//         );
//       } else {
//         // Handle the case where the response is missing expected fields
//         print('Response does not contain expected fields.');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Unexpected response from the server.'),
//           ),
//         );
//       }
//     } else {
//       // Handle other status codes if needed
//       print('Request failed with status: ${response.statusCode}');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to send phone number. Please try again.😬😬'),
//         ),
//       );
//     }
//   } catch (e) {
//     // Handle exceptions
//     print('Error: $e');
//     if (mounted) {
//       // Show an error message to the user
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('An error occurred. Please try again.'),
//         ),
//       );
//     }
//   }
// }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image with overlay
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Color.fromRGBO(0, 0, 0, 0.7), // Overlay color
              ),
            ),
            // Container with rounded corners and login content
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: 0,
              right: 0,
              bottom: screenHeight * 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF202020),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                //padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Josefin Sans'),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      PhoneNumberSignupTextField(
                        countryCode: '+91',
                        onPhoneNumberChanged:
                            updatePhoneNumber, // Update the enteredPhoneNumber variable
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: Divider(color: Colors.grey, thickness: 0.5),
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      GmailButton(),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have account',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Sign In?",
                                  style: TextStyle(color: Colors.orange),
                                ))
                          ],
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'By contiuning i agreee to the',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    ''' Terms and condition''',
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Privacy policy',
                                style: TextStyle(color: Colors.grey),
                              ))
                        ],
                      ),
                      ContinueButton(
                        
                        // Use the API call function here
                      ),

                      // Add your login form fields or other content here
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
