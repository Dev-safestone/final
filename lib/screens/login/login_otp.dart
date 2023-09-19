import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login/api/client.dart';
import 'package:login/screens/login/login_screen.dart';
import 'package:login/screens/login/login_sessionid.dart';
import 'package:login/screens/login/otp_verfy_login.dart';
import 'package:login/screens/signup_gmai/gmail_phone.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpLogin extends StatefulWidget {
  const OtpLogin({super.key});

  @override
  State<OtpLogin> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpLogin> {
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
                      MyApiClientServices.shared.sendOtp();
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
      LoginOtpVerifyButton(enteredPin),
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

  // Future<void> resendloginotp() async {
  //   var number = EmailPasswordPhoneState.enteredPhoneNumber;

  //   int? callnumber = int.tryParse(number);
  //   print(callnumber.runtimeType);

  //   if (callnumber != null) {
  //     // Check if callnumber is not null
  //     // Create a Dio instance
  //     final dio = Dio();

  //     try {
  //       // Define the API endpoint URL
  //       print(EmailPasswordPhoneState.enteredPhoneNumber);
  //       var response = await dio.post(
  //         'http://3.7.74.242:3000/auth-2factor/sendOtp',
  //         data: {
  //           'mobileNumber': callnumber.toString(), // Convert to String
  //         },
  //       );

  //       // Check if the request was successful (you can adjust the status code as needed)
  //       if (response.statusCode == 200) {
  //         print(response.data);

  //         // Extract the session ID from the response (assuming it's in JSON format)
  //         final sessionId = response.data['userDetails']['sessionId'];

  //         // Store the session ID in the LoginSessionId class
  //         LoginSessionId.sessionId = sessionId;

  //         // Store the session ID in SharedPreferences if needed
  //         // final prefs = await SharedPreferences.getInstance();
  //         // await prefs.setString('sessionId', sessionId);
  //         // print(sessionId);

  //         print('Session ID stored successfully: $sessionId');
  //       } else {
  //         print('API request failed with status code: ${response.statusCode}');
  //         // Handle the error as needed
  //       }
  //     } catch (e) {
  //       print('Error making API request: $e');
  //       // Handle the error as needed
  //     }
  //   } else {
  //     // Handle the case where the number couldn't be parsed as an integer
  //     print('Invalid phone number');
  //     // You might want to display an error message to the user here
  //   }
  // }
}
