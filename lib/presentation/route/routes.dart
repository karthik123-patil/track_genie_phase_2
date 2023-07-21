import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/view/auth/register_as_screen.dart';
import 'package:track_genie_phase_2/presentation/view/common/first_slide.dart';
import 'package:track_genie_phase_2/presentation/view/common/splashScreen.dart';

import '../view/auth/login_screen.dart';
import 'custom_route.dart';
class Routes {
  static dynamic route() {
    return {
      routeSplash: (BuildContext context) => const SplashPage(),
    };
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    switch(settings.name){
      case routeFirstSlide:
        return CustomRoute<bool>(
            builder: (BuildContext context) => const FirstSlide());
      case routeRegisterAs:
        return CustomRoute<bool>(
            builder: (BuildContext context) =>  const RegisterAsScreen());
      case routeLogin:
        return CustomRoute<bool>(
            builder: (BuildContext context) =>   LoginScreen());
    }
    return null;
  }
}