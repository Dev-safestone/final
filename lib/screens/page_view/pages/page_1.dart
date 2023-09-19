import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 256,
            //color: Colors.deepPurple[400],
            child: ListView(
              shrinkWrap: true, // Take only the necessary space
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              children: [
                Text(
                  "Safety Networks",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  "Use Safety Networks to connect with trusted contacts who can assist you during emergencies. Add your contacts and designate them as part of your network for quick access to help.",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
