import 'package:flutter/material.dart';

import 'checkbox.dart';
import 'new_password_field.dart';
import 'save_password_button.dart';

class ConfirmPassword extends StatelessWidget {
  const ConfirmPassword({super.key});

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

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
                        height: 20,
                      ),
                      Padding(
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
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //SizedBox(width: 1),
                            Text(
                              'New Password',
                              style: TextStyle(
                                color: Color(0xFF858585),
                                fontSize: 13.50,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      NewPasswordField(),

                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //SizedBox(width: 1),
                            Text(
                              'Re-Enter Password',
                              style: TextStyle(
                                color: Color(0xFF858585),
                                fontSize: 13.50,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      NewPasswordField(),


                      SizedBox(height: 30,),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CheckBox(),
                            Text(
                              'Agree to the',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    color: Color(0xFFEF8329),
                                    fontSize: 12,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w800,
                                  ),
                                )),
                           
                          ],
                        ),
                      ),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('and', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.w400,
                                ),),
                      
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      color: Color(0xFFEF8329),
                                      fontSize: 12,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )),
                          ],
                      
                      
                        ),
                      ),

                      SizedBox(height: 70,),


                      // SaveChangesButton ()

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
