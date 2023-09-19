import 'package:flutter/material.dart';
import 'package:login/models/userProfileModel.dart';
import 'package:login/screens/profileSection/edit_circles.dart';
import 'package:login/screens/profileSection/linear_tabbar.dart';
import 'package:login/screens/profileSection/message_button.dart';
import 'package:login/screens/profileSection/profile_tabbar.dart';
import 'package:login/screens/profileSection/setting_button.dart';
import 'package:login/screens/profileSection/share_profile_button.dart';

class ProfileWidgetLoading extends StatelessWidget {
  ProfileWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 282,
      child: Column(
        children: [
          // const SizedBox(height: 60),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundImage:
                          AssetImage('assets/images/placeholder.png'),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildInfoField('Posts', ''),
                          buildInfoField('Tags', ''),
                          buildInfoField('Safety Network', ''),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              EditCircles(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 6),
                        //width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SettingButton(),
                                MessageButton(),
                              ],
                            ),
                            ShareProfile()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Row(children: [
                //   SizedBox(
                //     width: 30,
                //   ),

                // ]),

                //
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoField(String count, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(6),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
