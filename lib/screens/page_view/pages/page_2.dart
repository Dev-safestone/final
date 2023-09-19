import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

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
                  "Safe Circles",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  "Use Safe Circles to create private groups for your friends and family. Share updates, stay connected, and coordinate plans all within a secure and private circle.",
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
