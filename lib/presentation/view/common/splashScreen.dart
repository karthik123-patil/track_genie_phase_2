import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/config/strings.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/splashScreenCubit.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashScreenCubit(),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<SplashScreenCubit, SplashScreenState>(
            listener: (context, state) {
              if (state == SplashScreenState.RegisterAsScreen) {
                  Navigator.of(context).pushNamed(routeRegisterAs);
              } else {
                  Navigator.of(context).pushNamed(routeFirstSlide);
              }
            },
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: AppColors.bgColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppStrings.appLogoImage, scale: 0.8,),

                        Text(
                          AppStrings.strAppName.tr(),
                          style: AppTextStyles.versionTextStyle,
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      AppStrings.strVersionCode.tr(),
                      style: AppTextStyles.versionTextStyle,
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
