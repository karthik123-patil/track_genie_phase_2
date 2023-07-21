import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/config/shared_preferences.dart';
import 'package:track_genie_phase_2/presentation/route/router_constants.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

import '../../../config/strings.dart';

class FirstSlide extends StatelessWidget {
  const FirstSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 720,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppStrings.backgroundImage,),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AppStrings.appContentImage, scale: 1.5,),
                            InkWell(
                              onTap: (){
                                StorageUtil.instance.setStringValue(AppStrings.strPrefScreenSeen,AppStrings.strPrefScreenSeen);
                                Navigator.of(context).pushNamed(routeRegisterAs);},
                              child: Text(
                                AppStrings.strSkip,
                                style: AppTextStyles.skipTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.strManageSchool,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.headingOneTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: AppStrings.strLinkTheSchool,
                              style: AppTextStyles.heading2Style,
                              children: <TextSpan>[
                                TextSpan(text: AppStrings.strOneBusses, style: AppTextStyles.subHeadingStyle),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50,),
                      Image.asset(AppStrings.vehicleImage, scale: 1.5,),

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    StorageUtil.instance.setStringValue(AppStrings.strPrefScreenSeen, "SCREEN_SEEN");
                    Navigator.of(context).pushNamed('/SecondSlide');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          AppStrings.strNext,
                          style: AppTextStyles.stepTextStyle,
                        ),
                        const SizedBox(height: 10,),
                        Image.asset('assets/images/forward_img.png', scale: 1.5,),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    exit(0);
    return true;
  }
}
