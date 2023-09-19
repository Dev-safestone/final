import 'package:login/screens/Popup_for_SOS/sospopup_initial.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
Future<void> initOneSignal() async {
  // Set App Id.
  String kOneSignalAppID = "0e8be214-66aa-4d67-bbf0-41857c15d9f9";
  await OneSignal.shared.setAppId(kOneSignalAppID);

  // Get the OneSignal userId and update that into Firebase.
  final status = await OneSignal.shared.getDeviceState();
  final String? osUserID = status?.userId;
  

  // Print the OneSignal player ID to the console
  print("OneSignal Player ID: $osUserID");

  // Store it in shared prefs, so that it can be used later.
  Preferences.setOnesignalUserId(osUserID);

  // Prompt for push notification permission
  await OneSignal.shared.promptUserForPushNotificationPermission(
    fallbackToSettings: true,
  );

  // Set notification handlers
  OneSignal.shared.setNotificationWillShowInForegroundHandler(
    handleForegroundNotifications,
  );

  OneSignal.shared.setNotificationOpenedHandler(handleBackgroundNotification);
}
//------------------------------------------------------------------------------------------------------//
class Preferences {
  static const String oneSignalUserIdKey = 'oneSignalUserId';

  static Future<void> setOnesignalUserId(String? osUserID) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(oneSignalUserIdKey, osUserID ?? '');
  }

  static Future<String?> getOnesignalUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(oneSignalUserIdKey);
  }
}
///Now, you can use Preferences.setOnesignalUserId(osUserID) 
///as you originally intended to save the OneSignal user ID. 
///Later, you can use Preferences.getOnesignalUserId() to retrieve it when needed
//--------------------------------------------------------
void handleForegroundNotifications(OSNotificationReceivedEvent event) {
  // Handle the notification when the app is in the foreground.
  // You can display a custom notification UI or take any other desired action.
  // For example, you can navigate to a specific page when a notification is received.

  final OSNotification notification = event.notification;
  print("Foreground Notification Received: ${notification.jsonRepresentation()}");

  // Use GetX's navigation to navigate to a specific page, e.g., 'SpecificPage'
  Get.to(() => FirstPopup()); // Replace with your specific page widget
}
//---------------------------------------------------------------------------------
void handleBackgroundNotification(OSNotificationOpenedResult openedResult) {
  // Handle the notification when it's opened from the background.
  // You can navigate to a specific screen or take any other desired action
  // based on the notification content.
  // For example, you can use Flutter's navigation to route to a particular screen.
  // You'll need to access your Navigator and routes to do this.
}

