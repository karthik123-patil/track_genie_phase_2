import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/domain/model/DraverItem.dart';
import '../config/constant.dart';


import 'homeScreen.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({super.key});
  final drawerItems = [
    DrawerItem(Constant.home, Icons.home),
    DrawerItem(Constant.myAtms, Icons.point_of_sale),
    DrawerItem(Constant.changePassword, Icons.lock_reset_outlined),
    DrawerItem(Constant.serviceRequest, Icons.home_repair_service_rounded),
    DrawerItem(Constant.txt194nDeclaration, Icons.upload_file_rounded),
    DrawerItem(Constant.informative, Icons.video_library),
    DrawerItem(Constant.contactus, Icons.contact_support),
    DrawerItem(Constant.profile, Icons.account_circle),
    DrawerItem(Constant.about, Icons.info),
    DrawerItem(Constant.logout, Icons.logout),
  ];

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<DashBoardScreen> {
  int _selectedDrawerIndex = 0;

  String currentProfilePic =
      "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeScreen();
      // case 1:
      //   return const MyATMSListScreen();
      // case 2:
      //   return ChangePasswordScreen();
      // case 5:
      //   return InformativeMediaScreen();
      // case 6:
      //   return const ContactUsScreen();
      // case 7:
      //   return ProfileScreen();
      case 8:
        // return AboutScreen();
      default:
        return HomeScreen();
    }
  }

  _onSelectItem(int index) {
    setState(() {
      Navigator.of(context).pop();
      _selectedDrawerIndex = index;
      if (index == 3) {
        _selectedDrawerIndex = 0;
        // Navigator.pushNamed(context, routeServiceRequest);
      } else if (index == 4) {
        _selectedDrawerIndex = 0;
        // Navigator.pushNamed(context, route194ND);
      } else if (index == 9) {
        // CustomPopups.getInstance().showOkCancelDialog(
        //     context, Constant.logout, Constant.logoutMsg, onYesTab: () {
        //
        //   Navigator.of(context).pop();
        //   Navigator.pushNamed(context, routeLogin);
        // }, onNoTap: () {
        //   Navigator.of(context).pop();
        // });
        _selectedDrawerIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        selectedColor: AppColors.secondaryColor,
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return WillPopScope(
      onWillPop: () async {
        if (_selectedDrawerIndex != 0) {
          setState(() {
            _selectedDrawerIndex = 0;
          });
          _getDrawerItemWidget(_selectedDrawerIndex);
        } else {
          Navigator.pop(context, true);
        }

        // exit(0);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_selectedDrawerIndex == 3 ||
                  _selectedDrawerIndex == 4 ||
                  _selectedDrawerIndex == 9
              ? widget.drawerItems[0].title
              : widget.drawerItems[_selectedDrawerIndex].title),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: const Text("bindsoni1998@gmail.com"),
                accountName: const Text("SONI BIND"),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(currentProfilePic),
                  ),
                  onTap: () => print("This is your current account."),
                ),
              ),
              Column(children: drawerOptions)
            ],
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }
}
