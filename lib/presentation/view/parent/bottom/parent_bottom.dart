import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/presentation/view/parent/bus_info/bus_info_screen.dart';
import 'package:track_genie_phase_2/presentation/view/parent/contacts/parent_contact_screen.dart';
import 'package:track_genie_phase_2/presentation/view/parent/settings/parent_settings_screen.dart';
import 'package:track_genie_phase_2/presentation/view/parent/status/status_screen.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

class ParentBottomScreen extends StatefulWidget {
  final int intCurIndex;

  const ParentBottomScreen({Key? key, required this.intCurIndex})
      : super(key: key);

  @override
  _ParentBottomScreenState createState() => _ParentBottomScreenState();
}

class _ParentBottomScreenState extends State<ParentBottomScreen> {
  final List _screens = [
    ParentStatusScreen(),
    const BusInfoScreen(),
    const ParentContactScreen(),
    ParentSettingScreen()
  ];
  int _currentIndex = 0;
  final List _label = [
    "Status",
    "Bus Info",
    "Contacts",
    "Settings",
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.intCurIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 10.0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.bgColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.unSelectedColor,
          selectedItemColor: AppColors.blackColor,
          unselectedIconTheme: const IconThemeData(
            color: AppColors.unSelectedColor,
          ),
          selectedLabelStyle: AppTextStyles.selectedItemStyle,
          selectedIconTheme: const IconThemeData(color: AppColors.blackColor),
          unselectedLabelStyle: AppTextStyles.unselectedItemStyle,
          elevation: 20.0,
          items: [
            'assets/images/location_img.png',
            'assets/images/fleet_img.png',
            'assets/images/contacts_img.png',
            'assets/images/settings_img.png'
          ]
              .asMap()
              .map((key, value) => MapEntry(
                    key,
                    BottomNavigationBarItem(
                      label: _label[key],
                      icon: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: _currentIndex == key
                              ? Colors.transparent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Image.asset(
                          value.toString(),
                          scale: 1.5,
                          color: _currentIndex == key
                              ? AppColors.blackColor
                              : AppColors.unSelectedColor,
                        ),
                      ),
                    ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}
