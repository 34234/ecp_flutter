
import 'package:camera/camera.dart';
import 'package:ecp_mobile/app/theme/app_theme.dart';
import 'package:ecp_mobile/services/connectivityService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/CameraUtil.dart';
import 'app/utils/MiddleWare.dart';
Future<void> main() async {

  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
  //initService();
}

void initService() async {
  print('starting services ...');
 await  Get.putAsync(() =>ConnectivityService().init());
  print('All services started...');
}

class MyApp extends StatefulWidget  {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _debugLabelString = "";
  String _emailAddress;
  String _smsNumber;
  String _externalUserId;
  bool _enableConsentButton = false;

  // CHANGE THIS parameter to true if you want to test GDPR privacy consent
  bool _requireConsent = true;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
      theme: AppTheme.light,
      //darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
    );
  }
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    if (!mounted) return;

    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("e18f78f5-0a9a-4189-a16a-58b34b2de32d");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });


    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      // Will be called whenever the subscription changes
      // (ie. user gets registered with OneSignal and gets a user ID)
    });
  }
}