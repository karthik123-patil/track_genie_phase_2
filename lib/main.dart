import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:track_genie_phase_2/data/datasources/network/notification_service.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/route/routes.dart';

import 'config/colorConstant.dart';
import 'config/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService().setupInteractedMessage();
  await Firebase.initializeApp();

  await runZonedGuarded(() async => runApp(const MyApp()), (error, stack) {
    if (kDebugMode) {
      print(error.toString());
    }
  });
  RemoteMessage? initialMessage =
  await FirebaseMessaging.instance.getInitialMessage();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor.toMaterialColor(),
        // fontFamily: 'Poppins',
      ),
      initialRoute: routeSplash,
      title: AppStrings.strAppName,
      debugShowCheckedModeBanner: false,
      // locale: translator.activeLocale,
      // localizationsDelegates: translator.delegates,
      // supportedLocales: translator.locals(),
      routes: Routes.route(),
      onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
    );
  }
}
