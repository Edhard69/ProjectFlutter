
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> oneSignalInitialize() async{
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("2ff44b4c-a5be-4c35-a6c6-4d432a22751d");
  await OneSignal.shared.consentGranted(true);

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  /*await OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });*/
}