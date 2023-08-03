import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/auth/loginBloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/bus_info/bus_info_cubit.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/contacts/parent_contact_bloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/setting/notification_setting_bloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/setting/student_info_bloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/status/type_of_journey_bloc.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/view/auth/register_as_screen.dart';
import 'package:track_genie_phase_2/presentation/view/common/first_slide.dart';
import 'package:track_genie_phase_2/presentation/view/common/splashScreen.dart';
import 'package:track_genie_phase_2/presentation/view/parent/bottom/parent_bottom.dart';
import 'package:track_genie_phase_2/presentation/view/parent/settings/student_information.dart';
import 'package:track_genie_phase_2/presentation/view/parent/status/type_of_journey.dart';
import 'package:track_genie_phase_2/presentation/view/vehicle_scheduled.dart';

import '../view/auth/login_screen.dart';
import '../view/check_notification_test.dart';
import '../view/driver/driver_trip.dart';
import '../view/parent/settings/notification_settings.dart';
import 'custom_route.dart';

class Routes {
  static dynamic route() {
    return {
      routeSplash: (BuildContext context) => const SplashPage(),
    };
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeFirstSlide:
        return CustomRoute<bool>(
            builder: (BuildContext context) => const FirstSlide());
      case routeRegisterAs:
        return CustomRoute<bool>(
            builder: (BuildContext context) => const RegisterAsScreen());
      case routeLogin:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => LoginBloc(), child: LoginScreen()),
        );
      case routeVehicleScheduled:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => LoginBloc(),
              child: const VehicleScheduledScreen()),
        );
      case routeTypeOfJourney:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => TypeOFJourneyCubit(),
              child: TypeOFJourneyScreen()),
        );

      case routeParentBottom:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => ParentContactCubit(),
                      ), BlocProvider(
                        create: (context) => BusInfoCubit(),
                      ),
                    ],
                    child: const ParentBottomScreen(
                      intCurIndex: 0,
                    )));
      case routeStudentInfo:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => StudentInfoCubit(),
              child: const StudentInformationScreen()),
        );
      case routeTest:
        return MaterialPageRoute(
          builder: (_) =>  CheckNotificationCheck(),
        );
      case routeDriverTrip:
        return MaterialPageRoute(
          builder: (_) => DriverTripScreen(),
        );

      case routeNotificationSetting:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => NotificationSettingCubit(),
              child: const NotificationSettingsScreen()),
        );
    }
    return null;
  }
}
