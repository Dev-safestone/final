import 'package:flutter/material.dart';
import 'package:login/utils/consts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'pages/page_1.dart';
import 'pages/page_2.dart';
import 'pages/page_3.dart';
import 'pages/page_4.dart';

class PageViewTest extends StatelessWidget {
  final _controller = PageController();

  PageViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set background transparent
      body: // Resize container according to screen height
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center the content vertically
        children: [
          // page view
          Expanded(
            child: PageView(
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast),
              controller: _controller,
              children: const [
                Page1(),
                Page2(),
                Page3(),
                Page4(),
              ],
            ),
          ),
          // spacing between the page view and dot indicators
          Padding(
            padding: const EdgeInsets.only(
                bottom: 100), // Adjust the value to control the gap
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: WormEffect(
                activeDotColor: primaryColor, // Set dot color to orange
                dotColor: Colors.deepPurple.shade100,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 6, // Set the spacing between the dots
                //verticalOffset: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
