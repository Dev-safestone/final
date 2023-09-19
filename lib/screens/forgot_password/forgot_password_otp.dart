import 'package:flutter/material.dart';

import '../opt code/otp_code.dart';
import '../opt code/verify_button.dart';
import 'verify_for_forgot_password.dart';

class ForgotPasswordOtp extends StatelessWidget {
  const ForgotPasswordOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image with overlay
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0.7), // Overlay color
              ),
            ),
            // Container with rounded corners and login content
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: 0,
              right: 0,
              bottom: screenHeight * 0,
              child: Container(
                decoration: const BoxDecoration(
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
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Josefin Sans'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          'Enter OTP sent to your registered number or email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 80,),

                      //OtpForm(),

                      const SizedBox(height: 20,),
                      Center(
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Didn't receive the OTP?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'poppins'),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Resend',
                                  style: TextStyle(color: Colors.orange),
                                ))
                          ],
                        ),
                      ),

                      SizedBox(height: 190,),

                      verifyForForgotPasswordButton()
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
