import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/screens/bottom_nav_bar/home_widget.dart';

class GmailButton extends StatelessWidget {
  const GmailButton({Key? key});

  Future<void> googleLogin(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var result = await _googleSignIn.signIn();
      if (result == null) {
        return;
      }

      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to the HomeWidget upon successful login
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomeWidget(), // Replace with your navigation logic
          ),
        ); // Replace 'HomeWidget' with your desired route
    } catch (error) {
      print(error);
      // Show an error snack bar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error signing in with Google'),
          //backgroundColor: Colors.red, // Customize the snack bar color
        ),
      );
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Container(
        child: ElevatedButton(
          onPressed: () => googleLogin(context), // Pass the context to the method
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Colors.grey, width: 1.0),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(double.infinity, 55.0),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/search.png',
                width: 24,
                height: 24,
              ),
              SizedBox(width: 8),
              Text(
                'Login with Google',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
