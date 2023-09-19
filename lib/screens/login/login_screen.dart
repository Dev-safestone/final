// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/screens/login/customTextFieldWidget.dart';
import 'package:login/screens/login/user_name.dart';
import 'package:login/screens/login/login_button.dart';
import 'package:login/screens/login/password_field.dart';
import 'package:login/screens/login/phone_number.dart';
import 'package:login/screens/signup_gmai/gmail_phone.dart';

import '../../utils/consts.dart';

class EmailPasswordPhone extends StatefulWidget {
  const EmailPasswordPhone({super.key});

  @override
  State<EmailPasswordPhone> createState() => EmailPasswordPhoneState();
}

class EmailPasswordPhoneState extends State<EmailPasswordPhone> {
  static String enteredPhoneNumber = ''; // Initialize with an empty string

  void updatePhoneNumber(String newPhoneNumber) {
    setState(() {
      enteredPhoneNumber =
          newPhoneNumber; // Update the enteredPhoneNumber variable
    });
  }

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/loginBg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Color.fromRGBO(0, 0, 0, 0.7), // Overlay color
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  // Background image with overlay

                  Transform(
                    transform: Matrix4.translationValues(0, -30, 0),
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
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 32,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            // Add your login form fields or other content here

                            PhoneNumberTextField(
                              countryCode: '+91',
                              onPhoneNumberChanged: updatePhoneNumber,
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding: EdgeInsets.only(left: 25, right: 25),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                        color: const Color.fromARGB(
                                            255, 101, 101, 101),
                                        thickness: 0.4),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: 12, left: 12),
                                    child: Text(
                                      "OR",
                                      style: const TextStyle(
                                        color: Color(0xFF858585),
                                        fontSize: 13.50,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                        color: const Color.fromARGB(
                                            255, 101, 101, 101),
                                        thickness: 0.4),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            customTextFieldWidget(
                                'Username',
                                _userNameController,
                                () {},
                                TextInputType.name,
                                appLightGrey,
                                "assets/images/user.png",
                                false,
                                false,
                                ''),
                            SizedBox(height: 12),
                            customTextFieldWidget(
                                'Password',
                                _passwordController,
                                () {},
                                TextInputType.visiblePassword,
                                appLightGrey,
                                'assets/images/padlock.png',
                                true,
                                false,
                                ''),

                            Container(
                              margin: EdgeInsets.only(right: 20, left: 20),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text('Forgot passcode ?',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.50))),
                            ),

                            SizedBox(height: 8),

                            LoginButton(),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: () =>
                                      Get.to(() => GmailPhoneSignup()),
                                  child: Text('Create Account',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
