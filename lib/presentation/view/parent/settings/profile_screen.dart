import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../config/colorConstant.dart';
import '../../../../config/shared_preferences.dart';
import '../../../../config/strings.dart';
import '../../../route/router_constants.dart';
import '../../../widgets/text-style.dart';

class StudentProfileScreen extends StatelessWidget {
  StudentProfileScreen({Key? key}) : super(key: key);

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()=> _onWillPop(context),
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child:
              Column(
                children: [
                  const SizedBox(height: 50,),
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReb5x7MU5cl5ngSDnEfX-mpE0x7LfPHqZPa7R2Z_ufFeD944_PwxrYHnKjhHDrjTfeoyk&usqp=CAU",
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 60,
                          backgroundImage: imageProvider,
                        ),
                      ),

                      /*Positioned(
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
                          )*/
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
              ),
            ),
          ),
        ));
  }

  void navigateToStudent(BuildContext context) {
    Navigator.of(context).pushNamed(routeParentBottom);
  }
  void navigateToDriver() {
    /*Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) => const DriverBottomScreen(
        intCurIndex: 0,
        uniqueId: "",
        isQrScanned: false,
        qrCode: "null",
      )),
    );*/
  }

  Future<bool> _onWillPop(BuildContext context) async {
    String loginAs = await StorageUtil.instance.getStringValue(AppStrings.strPrefRegisterAs);
    if(loginAs == 'Student') {
      navigateToStudent(context);
    }else{
      navigateToDriver();
    }
    return true;
  }
}
