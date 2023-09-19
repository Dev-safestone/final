// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/api/client.dart';
import 'package:login/screens/opt%20code/verify_button.dart';
import 'package:login/screens/signup_gmai/SessionData.dart';
import 'package:pinput/pinput.dart';
import 'package:login/screens/signup_gmai/gmail_phone.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_nav_bar/bottom_nav_bar.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  String enteredPin = '';
  int countdown = 60; // Countdown timer in seconds
  late ValueNotifier<int> countdownNotifier;

  String phone = GmailPhoneSignupState.enteredPhoneNumber;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    countdownNotifier = ValueNotifier<int>(countdown);
    startCountdown();
  }

  void startCountdown() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
        countdownNotifier.value = countdown;
      } else {
        timer.cancel();
      }
    });
  }

  void restartCountdown() {
    setState(() {
      countdown = 60; // Reset the countdown to its initial value
    });
    timer.cancel(); // Cancel the current timer
    startCountdown(); // Start a new timer
  }

  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Column(children: [
      Pinput(
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        onChanged: (pin) {
          setState(() {
            enteredPin = pin; // Update the entered OTP variable
          });

          // Save the entered OTP to SharedPreferences
          saveEnteredOTP(pin);
        },
      ),
      SizedBox(height: 50),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Didn't receive the OTP?",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins'),
            ),
            ValueListenableBuilder<int>(
              valueListenable: countdownNotifier,
              builder: (context, remainingSeconds, child) {
                if (remainingSeconds == 0) {
                  return TextButton(
                    onPressed: () {
                      MyApiClientServices.shared.sendOtpRegistration();
                      restartCountdown();
                    },
                    child: Text(
                      'Resend',
                      style: TextStyle(color: Colors.orange),
                    ),
                  );
                } else {
                  return Text(
                    'Resend in $remainingSeconds seconds',
                    style: TextStyle(color: Colors.grey),
                  );
                }
              },
            ),
          ],
        ),
      ),
      SizedBox(height: 90),
      VerifyButton(enteredPin),
    ]);
  }

  Future<void> saveEnteredOTP(String enteredOTP) async {
    try {
      // Save the entered OTP in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('entered_otp', enteredOTP);

      print('Entered OTP saved: $enteredOTP');
    } catch (e) {
      print('Error saving OTP: $e');
    }
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}




// class OtpForm extends StatefulWidget {
//   final GmailPhoneSignupState gmailPhoneSignupState; // Add this field

//   OtpForm(this.gmailPhoneSignupState); // Constructor
//   @override
//   _OtpFormState createState() => _OtpFormState();
// }



// class _OtpFormState extends State<OtpForm> {
//   String enteredPin = ''; // Store the entered OTP pin
//   int countdown = 60; // Countdown timer in seconds
//   late ValueNotifier<int> countdownNotifier;
//   late Timer timer;
//   String phone = GmailPhoneSignupState.enteredPhoneNumber;
//   @override
//   void initState() {
//     super.initState();
//     countdownNotifier = ValueNotifier<int>(countdown);
//     startCountdown();
//   }

//   void startCountdown() {
//     const oneSecond = Duration(seconds: 1);
//     timer = Timer.periodic(oneSecond, (timer) {
//       if (countdown > 0) {
//         setState(() {
//           countdown--;
//         });
//         countdownNotifier.value = countdown;
//       } else {
//         timer.cancel();
//       }
//     });
//   }

//   void restartCountdown() {
//     setState(() {
//       countdown = 60; // Reset the countdown to its initial value
//     });
//     timer.cancel(); // Cancel the current timer
//     startCountdown(); // Start a new timer
//   }

//   void updateEnteredPin(String pin) {
//     setState(() {
//       enteredPin = pin; // Store the entered OTP pin
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: TextStyle(
//           fontSize: 20,
//           color: Color.fromRGBO(30, 60, 87, 1),
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
// //print(phone);
//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
//       borderRadius: BorderRadius.circular(8),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith(
//         color: Color.fromRGBO(234, 239, 243, 1),
//       ),
//     );

//     return Column(
//       children: [
//         Pinput(
//           defaultPinTheme: defaultPinTheme,
//           focusedPinTheme: focusedPinTheme,
//           submittedPinTheme: submittedPinTheme,
//           pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//           showCursor: true,
//           onCompleted: (pin) {
//             updateEnteredPin(pin); // Update the entered OTP pin
//           },
//         ),
//         SizedBox(height: 50),
//         Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Didn't receive the OTP?",
//                 style: TextStyle(
//                     color: Colors.grey,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: 'poppins'),
//               ),
//               ValueListenableBuilder<int>(
//                 valueListenable: countdownNotifier,
//                 builder: (context, remainingSeconds, child) {
//                   if (remainingSeconds == 0) {
//                     return TextButton(
//                       onPressed: () {
//                         //resendOtp();
//                         restartCountdown();
//                       },
//                       child: Text(
//                         'Resend',
//                         style: TextStyle(color: Colors.orange),
//                       ),
//                     );
//                   } else {
//                     return Text(
//                       'Resend in $remainingSeconds seconds',
//                       style: TextStyle(color: Colors.grey),
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 90),
//         VerifyButton(enteredPin), // Pass the entered pin to VerifyButton
//       ],
//     );
//   }

//   Future<void> resendOtp() async {
//     Dio dio = Dio();
//     print(phone);

//     try {
//       Response response = await dio.post(
//         'http://3.7.74.242:3000/auth-2factor/sendOtp',
//         data: {
//           'mobileNumber': phone,
//         },
//       );

//       if (response.statusCode == 200) {
//         Map<String, dynamic> responseData = response.data;

//         // Check if the response contains the "message" and "userDetails" fields
//         if (responseData.containsKey('message') &&
//             responseData.containsKey('userDetails')) {
//           String message = responseData['message'];
//           Map<String, dynamic> userDetails = responseData['userDetails'];

//           // Extract session ID
//           String? mySessionId = userDetails['sessionId'];

//           if (mySessionId != null) {
//             // Store the session ID in SessionData
//             SessionData.sessionId = mySessionId;
//             print('Session ID: $mySessionId'); // this is my sessiion id
//           } else {
//             // Handle the case where the session ID is null or not present
//             print('Session ID is null or not present in the response.');
//           }

//           // Print the message and userDetails data
//           print('Message: $message');
//           print('User Details: $userDetails');

//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('$message 🥳🥳🥳🥳.'),
//             ),
//           );

//           // You can use userDetails as needed here

//           // Handle navigation or other tasks here
//         } else {
//           // Handle the case where the response is missing expected fields
//           print('Response does not contain expected fields.');
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Unexpected response from the server.'),
//             ),
//           );
//         }
//       } else {
//         // Handle other status codes if needed
//         print('Request failed with status: ${response.statusCode}');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to send phone number. Please try again.😬😬'),
//           ),
//         );
//       }
//     } catch (e) {
//       // Handle exceptions
//       print('Error: $e');
//       if (mounted) {
//         // Show an error message to the user
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('An error occurred. Please try again.'),
//           ),
//         );
//       }
//     }
//   }

//   @override
//   void dispose() {
//     timer.cancel(); // Cancel the timer when the widget is disposed
//     super.dispose();
//   }
// }
//}