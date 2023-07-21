import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/presentation/widgets/custom_edit_widgets.dart';
import 'package:track_genie_phase_2/presentation/widgets/custom_text_style.dart';
import '../config/constant.dart';
import '../data/model/ProfileModel.dart';
import 'bloc_logic/bloc/profile_cubit.dart';
import 'bloc_logic/state/CommonState.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController userId = TextEditingController();
  TextEditingController userType = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileCubit, CommonState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            ProfileModel data = state.data as ProfileModel;
            username.text = data.name;
            mobileNumber.text = data.mobile;
            emailId.text = data.emailId;
            userId.text = data.loginId;
            userType.text = data.userType;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 128,
                    child: Center(
                      child: Container(
                        height: 128,
                        width: 128,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(64),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: AppColors.darkYellowColor, spreadRadius: 1),
                          ],
                        ),
                        child: const Image(
                          image: AssetImage(Constant.icAppIconProfilePic),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomEditField.getEditField(
                      controller: username,
                      iconData: Icons.account_box,
                      hintName: Constant.hintName,
                      isEnable: false),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomEditField.getEditField(
                      controller: mobileNumber,
                      iconData: Icons.phone,
                      hintName: Constant.hintMobile,
                      isEnable: false),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomEditField.getEditFieldMaxLength(
                      controller: emailId,
                      hintName: Constant.hintEmail,
                      isEnable: false,
                      length: 2,
                      suffix: Icons.cancel,
                      prefix: Icons.email,
                      isVerified: data.isEmailVerified == "1" ? true : false),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    child: CustomTextStyle.bold(
                        color: AppColors.green800,
                        text: data.isEmailVerified == "1"
                            ? Constant.emailVerified
                            : Constant.emailNotVerified),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomEditField.getEditField(
                      controller: userId,
                      iconData: Icons.account_box,
                      hintName: Constant.hintUserId,
                      isEnable: false),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomEditField.getEditField(
                      controller: userType,
                      iconData: Icons.group,
                      hintName: Constant.hintUserType,
                      isEnable: false),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
