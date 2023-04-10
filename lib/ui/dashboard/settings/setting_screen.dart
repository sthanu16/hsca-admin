import 'package:flutter/material.dart';
import 'package:hsca/common/constant/image.dart';
import 'package:hsca/common/constant/sizes.dart';
import 'package:hsca/common/constant/string.dart';
import 'package:hsca/common/constant/text_style_common.dart';
import 'package:hsca/ui/dashboard/settings/change_password.dart';
import 'package:hsca/ui/dashboard/logout/logout_screen.dart';
import 'package:hsca/ui/dashboard/settings/softwere_update_screen.dart';
import '../../../common/constant/color_constants.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  int index=0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        StringControl.settings,
                          style: AppTextStyle.styleHeading20blw500
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 6),
                      child: Text(
                        StringControl.changePresets,
                          style: AppTextStyle.styleAppBar16w600.copyWith(color: ColorConstants.blackLightColor,fontSize: 14)

                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex:1,
                    child: Container(
                      height: height*0.9,
                      padding: const EdgeInsets.all(15.0),
                      child: Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  index = 0;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                  color: index ==0 ?ColorConstants
                                      .greyLightColor : Colors.transparent,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(ImageControl.software,height: 25,
                                    ),
                                    const SizedBox(
                                      width: 18,
                                    ),
                                    Text(StringControl.softwareUpdate,
                                        style: AppTextStyle.styleAppBar16w600
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorConstants.themeColor),
                                      child: const Icon(Icons.arrow_forward_ios,size: 10,color: Colors.white,),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            addHeight(8),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  index = 1;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: index ==1 ?ColorConstants
                                      .greyLightColor : Colors.transparent,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 35,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: ColorConstants.navyBlueColor
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Text("*",
                                            style: TextStyle(color: ColorConstants.whiteColor),
                                          ),
                                          Text("*",
                                            style: TextStyle(color: ColorConstants.whiteColor),
                                          ),
                                          Icon(Icons.lock,size: 10,color: ColorConstants.whiteColor)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Text(StringControl.changePassword,
                                          style: AppTextStyle.styleAppBar16w600
                                      ),
                                    // ),

                                    const Spacer(),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration:
                                      const BoxDecoration(shape: BoxShape.circle,
                                          color: ColorConstants.themeColor),
                                      child: const Icon(Icons.arrow_forward_ios,size: 10,color: Colors.white,),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            addHeight(8),

                            InkWell(
                              onTap: (){
                                setState(() {
                                  index = 2;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration:  BoxDecoration(
                                  color: index ==2 ?ColorConstants
                                      .greyLightColor : Colors.transparent,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(ImageControl.logout,height: 20),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Text(StringControl.logout,
                                          style: AppTextStyle.styleAppBar16w600
                                      ),
                                    // ),
                                    const Spacer(),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration( shape: BoxShape.circle,
                                          color: ColorConstants.themeColor),
                                      child: const Icon(Icons.arrow_forward_ios,size: 10,color: Colors.white,),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child:index == 0? const SoftWareUpdateScreen(): index == 1? const ChangePasswordScreen():const LogoutScreen()
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }}
