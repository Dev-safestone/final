import 'package:flutter/material.dart';
import 'package:login/screens/googleMaps/caution_mode.dart';
import 'package:login/screens/googleMaps/safe_circle_button.dart';
import 'package:login/screens/googleMaps/search_box.dart';
import 'package:login/screens/googleMaps/sos.dart';
import 'package:login/screens/list_view/list_view.dart';

import '../onesignal/onesignal.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({super.key});
  // ignore: use_key_in_widget_constructors

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      // Bottom half of the screen
      decoration: const BoxDecoration(
        color: Color(0xFF202020), // #202020 background color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Transform(
              transform: Matrix4.translationValues(0, 50, -10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Quick Actions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SosButton(),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(child: CautionButton()),
                      Expanded(child: SafeCircleButton()),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Location Access',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(
                    height: 100,
                  ),
                  // Add your content here
                  //ListViewBuilder()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
