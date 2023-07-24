import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';


class ParentAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int index;
  const ParentAppBar({Key? key, required this.index}) : super(key: key);

  @override
  State<ParentAppBar> createState() => _ParentAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _ParentAppBarState extends State<ParentAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgColor,
      leading: Image.asset(
        'assets/images/app_content.png',
        scale: 0.8,
      ),
      actions: [
        InkWell(
            onTap: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NotificationScreen(index: widget.index)));
            },
            child: Image.asset(
              'assets/images/notify_img.png',
              scale: 2,
            )),
        InkWell(
          onTap: (){
            showPopupMenu();
          },
          child: Image.asset(
            'assets/images/profile_img.png',
            scale: 1.5,
          ),
        ),
      ],
    );
  }

  showPopupMenu() {
    showMenu<String>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      context: context,
      position: const RelativeRect.fromLTRB(25.0, 25.0, 0.0,
          0.0), //position where you want to show the menu on screen
      items: [
        {
          'value': "Profile",
          'label': 'Profile',
          'image': 'assets/images/user_img.png'
        },
        {
          'value': "Log Out",
          'label': 'Log Out',
          'image': 'assets/images/log_out.png'
        },
      ].map((item) {
        return PopupMenuItem(
          value: item['value'],
          child: ListTile(
            leading: item['value'] == "Log Out" ? Image.asset(item['image'].toString(), scale: 12,) :Image.asset(item['image'].toString(), scale: 1.5,),
            title: Text(
              item['label'].toString(),
              style: AppTextStyles.popMenuTextStyle,
            ),
          ),
        );
      }).toList(),
      elevation: 8.0,
    ).then((value) {
      if (value == "Log Out") {

        Navigator.of(context).pushNamed('/LoginScreen');
      }else{
        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const StudentInformationScreen()));
      }
    });
  }
}
