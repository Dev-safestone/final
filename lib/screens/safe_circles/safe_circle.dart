import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/safe_circles/create_button.dart';
import 'package:login/screens/user_profile/userTextField.dart';

class EditSafeCircles extends StatefulWidget {
  @override
  EditSafeCirclesState createState() => EditSafeCirclesState();
}

class EditSafeCirclesState extends State<EditSafeCircles> {
  TextEditingController safecirclenameController = TextEditingController();

  static String? storedSafecirclename;

  @override
  void dispose() {
    safecirclenameController.dispose();
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
                'Safe Circles',
                style: TextStyle(
                  color: Color(0xFFF3F3F3),
                  fontSize: 24,
                  fontFamily: 'Josefin Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Edit your safe circle",
                style: TextStyle(
                  color: Color(0xFFEF8329),
                  fontSize: 15,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Safe Circle Name',
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 13.50,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              UserProfileTextField(
                hintText: 'Your Safe Circle Name',
                controller: safecirclenameController,
                onChanged: (value) {
                  storedSafecirclename = value;
                },
              ),
              SizedBox(height: 50),
              CreateButton(),
            ],
          ),
        ),
      ),
    );
  }
}