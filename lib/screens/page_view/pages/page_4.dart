import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        child: Align(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ListView(
              shrinkWrap: true, // Take only the necessary space
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling
              children: const [
                Text(
                  "“With SafeStone, never feel alone while you are out and about!”",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
