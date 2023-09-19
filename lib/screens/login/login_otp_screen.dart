// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login/screens/login/login_otp.dart';
import 'package:login/screens/signup_gmai/gmail_phone.dart';

class LoginOtpHomePage extends StatelessWidget {
  const LoginOtpHomePage(
      {super.key, required Map<String, dynamic> userDetails});

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
                          'Verification',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Josefin Sans'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text('Enter OTP sent to your mobile number',
                            style: TextStyle(
                              color: Color(0xFFF1F0EF),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.14,
                            )),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Center(child: OtpLogin()), //GmailPhoneSignupState(),)),

                      // VerifyButton(enteredPin),// Pass the entered pin to VerifyButton

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
