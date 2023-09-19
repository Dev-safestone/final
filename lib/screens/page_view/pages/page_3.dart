import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

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
                const Text(
                  "SafeFeed",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  "SafeFeed shows updates from your Safe Circles, as well as interesting locations to explore. Stay up-to-date with your circles and discover new places to visit, all in one convenient feed.",
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
