import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:track_genie_phase_2/config/Helper.dart';
import 'package:track_genie_phase_2/config/colorConstant.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/bloc/parent/setting/student_info_bloc.dart';
import 'package:track_genie_phase_2/presentation/bloc_logic/state/CommonState.dart';
import 'package:track_genie_phase_2/presentation/widgets/student_information_appbar.dart';
import 'package:track_genie_phase_2/presentation/widgets/text-style.dart';

import '../../../../domain/model/studentInfo.dart';

class StudentInformationScreen extends StatelessWidget {
    StudentInformationScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return true;
      },
      child: Scaffold(
        appBar: const StudentInfoAppBar(
          index: 3,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          child: BlocConsumer<StudentInfoCubit,CommonState>(
            builder: (BuildContext context, state) {
              if(state is LoadedState){
                StudentInfo profileModel =  state.data as StudentInfo;
                name.text = profileModel.strName.toString();
                email.text = profileModel.strUniqueId.toString();
                mobile.text = profileModel.strContactNo.toString();
                return Column(
                  children: [
                    const SizedBox(height: 50,),
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: profileModel.strPhoto.toString(),
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          imageBuilder: (context, imageProvider) => CircleAvatar(
                            radius: 60,
                            backgroundImage: imageProvider,
                          ),
                        ),
                        Positioned(
                            bottom: 0.2,
                            right: 0.2,
                            child: InkWell(
                              onTap: getImage,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.bgColor,
                                ),
                                child: const Center(
                                  child: Icon(Icons.camera_alt_outlined, color: Colors.black, size: 20,),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                    const SizedBox(height: 50,),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: name,
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: "Name",
                              labelStyle: AppTextStyles.appBarTextStyle,
                              hintText: "Name",
                              alignLabelWithHint: true,
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              hintStyle:
                              const TextStyle(color: AppColors.blackColor),
                              /*suffixIcon: IconButton(
                            icon: const Icon(Icons.edit,
                                color: AppColors.blackColor),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: AppColors.bgColor,
                                barrierColor: Colors.transparent,
                                enableDrag: true,
                                elevation: 1,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                    side: BorderSide(
                                        color: Colors.black38)),
                                context: context,
                                builder: (BuildContext context) {
                                  return const UpdateUserBottomSheet(
                                      strEnable: "NAME",
                                      strName: "Karthik",
                                      strEmail: "", mobileNumber: "6364556357",);
                                },
                              );
                            },
                          ),*/
                            ),
                            style: AppTextStyles.appBarTextStyle,
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      height: 20,
                      indent: 10,
                      thickness: 1.5,
                      color: AppColors.dividerColor,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: email,
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: "Email",
                              labelStyle: AppTextStyles.appBarTextStyle,
                              hintText: "Email",
                              alignLabelWithHint: true,
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              hintStyle:
                              const TextStyle(color: AppColors.blackColor),
                              /*suffixIcon: IconButton(
                            icon: const Icon(Icons.edit,
                                color: AppColors.blackColor),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: AppColors.bgColor,
                                barrierColor: Colors.transparent,
                                enableDrag: true,
                                elevation: 1,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                    side: BorderSide(
                                        color: Colors.black38)),
                                context: context,
                                builder: (BuildContext context) {
                                  return const UpdateUserBottomSheet(
                                    strEnable: "NAME",
                                    strName: "Karthik",
                                    strEmail: "", mobileNumber: "6364556357",);
                                },
                              );
                            },
                          ),*/
                            ),
                            style: AppTextStyles.appBarTextStyle,
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      height: 20,
                      indent: 10,
                      thickness: 1.5,
                      color: AppColors.dividerColor,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: mobile,
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              labelText: "Mobile Number",
                              labelStyle: AppTextStyles.appBarTextStyle,
                              hintText: "Mobile Number",
                              alignLabelWithHint: true,
                              prefixIcon: const Icon(
                                Icons.phone_android_rounded,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              hintStyle:
                              const TextStyle(color: AppColors.blackColor),
                              /*suffixIcon: IconButton(
                            icon: const Icon(Icons.edit,
                                color: AppColors.blackColor),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: AppColors.bgColor,
                                barrierColor: Colors.transparent,
                                enableDrag: true,
                                elevation: 1,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                    side: BorderSide(
                                        color: Colors.black38)),
                                context: context,
                                builder: (BuildContext context) {
                                  return const UpdateUserBottomSheet(
                                    strEnable: "MOBILE",
                                    strName: "Karthik",
                                    strEmail: "karthikpatil69@gmail.com", mobileNumber: "6364556357",);
                                },
                              );
                            },
                          ),*/
                            ),
                            style: AppTextStyles.appBarTextStyle,
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      height: 20,
                      indent: 10,
                      thickness: 1.5,
                      color: AppColors.dividerColor,
                    ),
                  ],
                );
              }else if(state is LoadingState){
                return const CircularProgressIndicator();
              }
              return Container();

            },
            listener: (BuildContext context,  state) {  },
          ),
        ),
      ),
    );
  }

    Future getImage() async {
      ImagePicker imagePicker = ImagePicker();
      XFile? pickedFile = await imagePicker
          .pickImage(source: ImageSource.gallery)
          .catchError((err) {
        Helper.getToastMsg(err.toString());
      });
      File? image;
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
      if (image != null) {

        //uploadFile();
      }
    }
}
