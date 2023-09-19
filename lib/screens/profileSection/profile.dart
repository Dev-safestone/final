import 'package:flutter/material.dart';
import 'package:login/models/userProfileModel.dart';
import 'package:login/screens/profileSection/edit_circles.dart';
import 'package:login/screens/profileSection/linear_tabbar.dart';
import 'package:login/screens/profileSection/message_button.dart';
import 'package:login/screens/profileSection/profile_tabbar.dart';
import 'package:login/screens/profileSection/setting_button.dart';
import 'package:login/screens/profileSection/share_profile_button.dart';
import 'package:login/widgets/setting_button.dart';

class PersonalProfileWidget extends StatelessWidget {
  UserProfile userProfile;
  PersonalProfileWidget({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 312,
      child: Column(
        children: [
          // const SizedBox(height: 60),
          Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    //  BackButtonCustom(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userProfile.userId.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    userProfile.imageUrl != ""
                        ? CircleAvatar(
                            radius: 42,
                            backgroundImage:
                                NetworkImage(userProfile.imageUrl!),
                          )
                        : const CircleAvatar(
                            radius: 42,
                            backgroundImage:
                                AssetImage('assets/images/placeholder.png'),
                          ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildInfoField('Posts', '0'),
                          buildInfoField('Tags', '0'),
                          buildInfoField('Safety Network',
                              userProfile.safeCircles!.length.toString()),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Text(
                                      userProfile.name.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.people_alt_rounded,
                                          color: Colors
                                              .white, // White color for the icon
                                          size: 12, // Adjust the size as needed
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          userProfile.connections!.length
                                                  .toString() +
                                              " Connections",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_pin,
                                          color: Colors
                                              .white, // White color for the icon
                                          size: 16, // Adjust the size as needed
                                        ),
                                        Text(
                                          userProfile.city.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              EditCircles(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 6),
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
          margin: const EdgeInsets.all(6),
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
