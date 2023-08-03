import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';
import '../../config/colorConstant.dart';
import '../view/parent/bottom/parent_bottom.dart';

class NotificationScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  const NotificationScreenAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgColor,
      leading: IconButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>   const ParentBottomScreen(intCurIndex: 0)));
        },
        icon: const Icon(Icons.arrow_back, color: AppColors.blackColor,),
      ),
      title: Text(
        "Notifications",
        style: AppTextStyles.appBarTextStyle,
      ),
    );
  }
}
