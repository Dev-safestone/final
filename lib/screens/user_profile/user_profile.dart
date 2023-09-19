// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/forgot_password/save_password_button.dart';
import 'package:login/screens/user_profile/image.dart';
import 'package:login/screens/user_profile/save_changes_button.dart';

import 'package:login/screens/user_profile/userTextField.dart';

import 'package:url_launcher/url_launcher.dart';

class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  
  TextEditingController nameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

   static String? storedName;
  static String? storedUserId;
  static String? storedGender;
  static String? storedAge;
  static String? storedCity;
  static String? storedPassword;
  static String? storedConfirmPassword;
  

  bool _agreeToTerms = false;

   



  @override
  void dispose() {
    nameController.dispose();
    userIdController.dispose();
    genderController.dispose();
    ageController.dispose();
    cityController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Welcome to SafeStone',
                style: TextStyle(
                  color: Color(0xFFF3F3F3),
                  fontSize: 24,
                  fontFamily: 'Josefin Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Let’s get to know you better",
                style: TextStyle(
                  color: Color(0xFFEF8329),
                  fontSize: 15,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Profile Picture',
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 13.50,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(child: CircularImageWithEditIcon()),

              SizedBox(height: 10),
              Text(
                'Name',
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 13.50,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              UserProfileTextField(
  hintText: 'Priya Patel',
  controller: nameController,
  onChanged: (value) {
    storedName = value;
  },
),

              SizedBox(height: 10),

              Text(
                'User ID',
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 13.50,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              UserProfileTextField(
                hintText: 'PriyaP',
                controller: userIdController,
                onChanged: (value) {
    storedUserId = value;
  },
     
              ),
              SizedBox(height: 10),

              Text(
                'Gender',
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 13.50,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              UserProfileTextField(
                hintText: 'Female',
                controller: genderController,
                onChanged: (value) {
    storedGender = value;
  },
   
              ),
              SizedBox(height: 10),

              Text(
                'Age',
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 13.50,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              UserProfileTextField(
                hintText: '22',
                controller: ageController,
                onChanged: (value) {
    storedAge = value;
  },
 
              ),
              SizedBox(height: 10),

              Text(
                'City',
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 13.50,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              UserProfileTextField(
                hintText: 'Banglore',
                controller: cityController,
                onChanged: (value) {
    storedCity = value;
  },
 
              ),
              SizedBox(height: 10),

              Text(
                'Password',
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 13.50,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              UserProfileTextField(
                hintText: '***********',
                controller: passwordController,
                onChanged: (value) {
    storedPassword = value;
  },
  
              ),
              SizedBox(height: 10),

              Text(
                'Re-Enter Password',
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 13.50,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              UserProfileTextField(
                hintText: '***********',
                controller: confirmpasswordController,
                onChanged: (value) {
    storedConfirmPassword = value;
  },

              ),
              SizedBox(height: 10),

              // Simple CheckboxListTile with a white border
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value ?? false;
                      });
                    },
                    activeColor: Colors.orange,
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Agree to the ',
                            style: TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 13.50,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 13.50,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: _createTapGestureRecognizer(() {
                              //_launchURL();
                              // You can navigate to the policy page or show a dialog here
                              print('Privacy Policy clicked');
                            }),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 13.50,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 13.50,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: _createTapGestureRecognizer(() {
                              // Handle the Terms and Conditions link click
                              // You can navigate to the terms page or show a dialog here
                              print('Terms and Conditions clicked');
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              SaveChangesButton(
                  agreeToTerms:
                      _agreeToTerms), // Uncomment this line when you have SaveChangesButton implemented
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create a tap gesture recognizer
  TapGestureRecognizer _createTapGestureRecognizer(VoidCallback onTap) {
    return TapGestureRecognizer()..onTap = onTap;
  }
}
