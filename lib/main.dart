import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/key_properties.dart';
import 'core/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'core/notification_service.dart';
import 'firebase_options.dart';

import 'utils/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with explicit options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize notifications after Firebase is ready
  try {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    await NotificationService().initialize();
  } catch (e) {
    debugPrint("Firebase messaging initialization error: $e");
  }

  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  print("Brightness Value   ==>> $brightness");
  bool isDarkMode = brightness == Brightness.dark;
  print("System Theme ==>> $isDarkMode");
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  BuildEnvironment.init(
    flavor: BuildFlavor.production,
    baseUrl: KeyProperties.prodBaseUrl,
    imageUrl: KeyProperties.prodImageUrl,
    cloudFrontUrl: KeyProperties.prodCloudFrontUrl,
    googleMapsApiKey: KeyProperties.prodGoogleMapsApiKey,
  );
  await setUpServiceLocator();
  runApp(const App());
}
