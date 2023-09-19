import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/screens/page_view/pageview.dart';

import '../../utils/consts.dart';
import 'get_started_button.dart';

class WelcomeScreen extends StatelessWidget {

  
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: canvasColor,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height * 0.6,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      // bottomLeft: Radius.circular(100),
                      ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/intro.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Transform(
                  transform: Matrix4.translationValues(0, -40, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: canvasColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    //color: Colors.black,
                    child: Container(
                      height: height * 0.5,
                      child:
                          PageViewTest(), // Replace the carousel with PageViewTest
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Positioning the SVG logo
          Positioned(
            top: height * 0.55 - (width * 0.1),
            left: width * 0.4,
            child: Container(
              height: width * 0.2,
              width: width * 0.2,
              child: SvgPicture.asset('assets/images/Logo.svg'),
            ),
          ),
          // Start button
          SizedBox(
            height: 10,
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: StartedButton(),
            ),
          ),
        ],
      ),
    );
  }
}
