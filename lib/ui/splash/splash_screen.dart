import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hsca/common/constant/app_utils.dart';
import 'package:hsca/ui/auth/login/login_screen.dart';
import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../common/constant/responsive.dart';
import '../../common/constant/sizes.dart';
import '../../common/custom_widget/navigation_service.dart';
import '../../common/custom_widget/screen_size_dialog.dart';
import '../../common/locator/locator.dart';
import '../../common/router/router.gr.dart';
import '../dashboard/dashboard/dashboard_screen.dart';
import '../dashboard/dashboard/user/bloc/dashboard_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogIn = false;

  @override
  void initState() {

    super.initState();
    // if (mounted) {
    //   getLogin();
    //   // startTime();
    // }
  }

  getLogin() async {
    isLogIn = await AppUtils().getUserLoggedIn();
  }

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, redirectFunction);
  }

  void redirectFunction() {
      if(Responsive.isDesktop(context)){
      if (isLogIn) {
        BlocProvider.of<DashboardBloc>(context).add(DashboardRefreshEvent());
        locator<NavigationService>().pushAndRemoveUntil(const DashBoardScreenRoute());

      } else {
        locator<NavigationService>().pushAndRemoveUntil(const LoginScreenRoute());
      }
    }
    else{
      const CommonDialog();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      ImageControl.splash1,
                    ),
                    fit: BoxFit.cover,
                    )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(),
                  Column(
                    children: [
                      Image.asset(
                        ImageControl.logo,
                        scale: 7,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        StringControl.splashText,
                        style: AppTextStyle.styleHeading24blw700
                            .copyWith(color: ColorConstants.whiteColor),
                      ),
                      addHeight(10),
                       /* const SpinKitCubeGrid(     color: ColorConstants.greenColor,
                          size: 40,),*/
                        const SpinKitThreeBounce(
                        color: ColorConstants.greenColor,
                        size: 40,
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
