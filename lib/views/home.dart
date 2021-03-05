import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

//file
import 'index.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    initOneSignalNotification();
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initOneSignalNotification() async {
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
      // will be called whenever a notification is received
      print("Received notification");
      //print(notification.jsonRepresentation().replaceAll("\\n", "\n"));
      print(notification.payload.additionalData);
    });

    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) async {
      // will be called whenever a notification is opened/button pressed.
      Get.snackbar("One Signal", "Open Handler", snackPosition: SnackPosition.BOTTOM);
      print("Opened notification");
      print(result.notification.jsonRepresentation().replaceAll("\\n", "\n"));
      print(result.notification.payload.additionalData);
      dynamic data = result.notification.payload.additionalData;
      if (data != null) {
        if (data["type"] == "notification") {
          //Get.toNamed(appRoute.language);
        }
      }
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      // will be called whenever the permission changes
      // (ie. user taps Allow on the permission prompt in iOS)
      print("PERMISSION STATE CHANGED");
    });

    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      // will be called whenever the subscription changes
      //(ie. user gets registered with OneSignal and gets a user ID)
    });

    OneSignal.shared.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges emailChanges) {
      // will be called whenever then user's email subscription changes
      // (ie. OneSignal.setEmail(email) is called and the user gets registered
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeLayout();
  }
}
