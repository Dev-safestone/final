// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpTest extends StatelessWidget {
  const OtpTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the PIN input field themes for different states
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

    // Return the PIN input widget
    return Pinput(
      // Set the PIN input field themes
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      // Validator function for OTP validation
      validator: (String? pin) {
        // Call your API to validate the entered OTP
        // Replace 'expectedOTPFromAPI' with the actual expected OTP from your backend
        String expectedOTPFromAPI = '1234'; // Example expected OTP from API
        return pin == expectedOTPFromAPI ? null : 'Invalid OTP';
      },
      // Autovalidate the OTP on form submission
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      // Callback when OTP input is completed
      onCompleted: (String pin) {
        print(pin);
        // Here, you can compare the entered OTP with the expected OTP from your backend
        // Handle the verification process as needed
      },
    );
  }
}
