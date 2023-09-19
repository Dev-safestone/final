import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/api/client.dart';
import 'package:login/screens/background_location/background_location.dart';
import 'package:login/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:login/screens/bottom_nav_bar/home_widget.dart';
import 'package:login/screens/introPage/intro.dart';
import 'package:login/screens/list_view/list_view.dart';
import 'package:login/screens/location/location.dart';
import 'package:login/screens/onesignal/onesignal.dart';
import 'package:login/screens/safe_circles/safe_circle.dart';
import 'package:login/utils/SharePrefs.dart';
import 'package:login/utils/consts.dart';
import 'package:workmanager/workmanager.dart';

import 'screens/opt code/otp_home_page.dart';
import 'package:permission_handler/permission_handler.dart';

// Make sure this import is present

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print("Execute WorkManager .... ");
    MyApiClientServices.shared.updateUserLocation();
    LocationManager().fetchLocationInBackground();
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  Workmanager().registerPeriodicTask(
    "periodic-task-identifier",
    "simplePeriodicTask",
    // When no frequency is provided the default 15 minutes is set.
    // Minimum frequency is 15 min. Android will automatically change your frequency to 15 min if you have configured a lower frequency.
  );
  Workmanager().registerOneOffTask(
    '1',
    'background_location_task',
    initialDelay:
        Duration(seconds: 10), // Initial delay before running the task
  );
  // Initialize Firebase
  await Firebase.initializeApp();
  // Initialize LocationManager
  final locationManager = LocationManager();
  // Check if background location permission is granted
  var status = await Permission.locationAlways.status;

  if (status.isGranted) {
    await locationManager.fetchLocationInBackground();
  } else {
    // Handle the case where permission is not granted
    print("Background location permission not granted.");
    // You can show a dialog or message to the user here.
  }
  await locationManager
      .fetchLocationInBackground(); // Call the location manager

  // Initialize OneSignal
  //OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  // OneSignal.shared.setAppId("0e8be214-66aa-4d67-bbf0-41857c15d9f9");

  //OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
  //  print("Accepted permission: $accepted");
  //});
//
  // OneSignal.shared.setNotificationWillShowInForegroundHandler(
  //   (OSNotificationReceivedEvent event) {
  // Will be called whenever a notification is received in foreground
  // Display Notification, pass null param for not displaying the notification
  //  event.complete(event.notification);
  //});

  //OneSignal.shared
  //   .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
  // // Will be called whenever a notification is opened/button pressed.
  //});

  //OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
  // Will be called whenever the permission changes
  // (i.e., user taps Allow on the permission prompt in iOS)
  // });
//
  // OneSignal.shared
  //   .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
  // Will be called whenever the subscription changes
  // (i.e., user gets registered with OneSignal and gets a user ID)
  // });

  // OneSignal.shared.setEmailSubscriptionObserver(
  //     (OSEmailSubscriptionStateChanges emailChanges) {
  // Will be called whenever the user's email subscription changes
  // (i.e., OneSignal.setEmail(email) is called and the user gets registered)
  //});
  initOneSignal();
  getLocation();
  UserSharedPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Safe Stone',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
            brightness: Brightness.dark,
            textTheme: GoogleFonts.josefinSansTextTheme(
              Theme.of(context).textTheme,
            )),
        debugShowCheckedModeBanner: false,
        home: const Splash());

    //MyTabBar());
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3,
        splash: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/Logo.svg', // Replace with your SVG file path
              //width: 100, // Set the width and height as per your requirement
              //height: 100,
            ),
          ],
        ),
        nextScreen:   WelcomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        backgroundColor: canvasColor);
  }
}
