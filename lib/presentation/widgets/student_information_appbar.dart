import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/presentation/view/parent/bottom/parent_bottom.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';


class StudentInfoAppBar extends StatelessWidget implements PreferredSizeWidget{
  final int index;
  const StudentInfoAppBar({Key? key, required this.index}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgColor,
      leading: IconButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>   ParentBottomScreen(intCurIndex: index)));
        },
        icon: const Icon(Icons.arrow_back, color: AppColors.blackColor,),
      ),
      title: Text(
        "Student Information",
        style: AppTextStyles.appBarTextStyle,
      ),
    );
  }
}
