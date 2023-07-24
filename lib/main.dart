import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/route/routes.dart';
import 'package:track_genie_phase_2/presentation/view/common/splashScreen.dart';

import 'config/colorConstant.dart';
import 'config/strings.dart';

void main() {
  runApp(const MyApp());
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
