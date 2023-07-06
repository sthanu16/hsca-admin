import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hsca/common/constant/sizes.dart';
import 'package:hsca/ui/auth/login/login_screen.dart';

import '../../../common/constant/app_utils.dart';
import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/toast_service.dart';
import '../../../common/locator/locator.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: height*0.9,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.infinity,decoration: const BoxDecoration(
                color: ColorConstants.themeColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:  Radius.circular(10))
            ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                child: Text(StringControl.logout,
                    style: AppTextStyle.styleContainer20Blackw600
                ),
              ),
            ),
            const SizedBox(height: 120,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text("Are you sure want to log out?",
                        style: AppTextStyle.styleTxtField16bl2w400.copyWith(color: ColorConstants.brownColor,fontSize: 24)
                    )
            ),
                ],
              ),
            const SizedBox(
              height: 50,
            ),

            Center(
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.greenColor,
                ),
                child: InkWell(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Logout?'),
                          content: const Text('Are you sure you want to logout.'),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:  MaterialStateProperty.all<Color>(ColorConstants.greenColor),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('No'),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:  MaterialStateProperty.all<Color>(ColorConstants.greenColor),
                              ),
                              onPressed: () {
                                                AppUtils().logout();
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) => const LoginScreen()));
                                AppUtils().logoutUser();
                                locator<ToastService>().showInCenter( 'Logout Successfully');
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(ImageControl.logout,height: 25,color: ColorConstants.whiteColor,),
                      addWidth(2),
                      Text(StringControl.logout,style: AppTextStyle.styleAppBar16w600.copyWith(color: ColorConstants.whiteColor),)
                    ],
                  ),
                ),
              ),
            )
        /*    Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 220,
                  child: CustomButton(
                      text: StringControl.logout,
                      buttonColor: ColorConstants.greenColor,
                      onTap: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => const LoginScreen()));
                        AppUtils().logoutUser();
                        locator<ToastService>().showInCenter( 'Logout Successfully');
                      }
                  ),
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
