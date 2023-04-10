import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsca/common/locator/locator.dart';

import '../../../bloc/login_bloc.dart';
import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/loader_dialog.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield_web.dart';
import '../../../common/custom_widget/navigation_service.dart';
import '../../../common/custom_widget/toast_service.dart';
import '../../../common/router/router.gr.dart';
import '../../dashboard/dashboard/dashboard_screen.dart';
import '../../dashboard/dashboard/user/bloc/dashboard_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLogin = false;


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstants.blueColor,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: width,
              height: height,
              decoration:   const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageControl.splash1),
                    fit: BoxFit.cover,
                 ),

              ),
              child: Form(
                key: authFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageControl.logo,scale: 6,),
                    Text(StringControl.homeToCheck,textAlign: TextAlign.justify,
                      style: AppTextStyle.styleHeading24blw700.copyWith(
                          color: Colors.white,
                          fontSize: 22
                      ),
                    ),
                    // addHeight(5,),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 26.0),
                      child: SizedBox(
                        width: width*0.33,
                        child: CustomTextFieldWeb(
                          maxLines: 1,
                          headingText: StringControl.email,
                          controller: emailController,
                          hintText: StringControl.email,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                            child: Image.asset(ImageControl.email,scale: 3.5,color: ColorConstants.themeColor,),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 26.0),
                      child: SizedBox(
                        width: width*0.33,
                        child: CustomTextFieldWeb(
                          maxLines: 1,
                          headingText: StringControl.email,
                          obscureText: true,
                          controller: passwordController,
                          hintText: StringControl.password,
                          fillColor: ColorConstants.greyLightColor,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                            child: Image.asset(ImageControl.password,scale: 3.5,color: ColorConstants.themeColor,),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),


                    BlocConsumer<LoginBloc,LoginState>(
                      builder: (context,loginState){
                      return SizedBox(
                        width: width*0.2,
                        child: CustomButton(
                          textColor: ColorConstants.whiteColor,
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            //     DashBoardScreen()));
                            onCall(context);
                          },
                          //   onCall(context),
                          text: StringControl.login,
                          textSize: 20.sp,
                          buttonColor: ColorConstants.greenColor,
                        ),
                      );
                    }, listener: (context,loginState){
                      if(loginState is LoginLoadingState){
                        locator<DialogService>().showLoader();
                      }
                      else if(loginState is LoginSuccessState){
                        locator<DialogService>().hideLoader();
                        locator<ToastService>().showInCenter( loginState.loginModel?.message??"");
                          locator<NavigationService>().pop();
                          BlocProvider.of<DashboardBloc>(context).add(DashboardRefreshEvent());
                        locator<NavigationService>().pushAndRemoveUntil(const DashBoardScreenRoute());

                      }
                      else if(loginState is LoginErrorState){
                        locator<DialogService>().hideLoader();
                        locator<ToastService>().showInCenter( loginState.error);
                      }
                    }),


                    const SizedBox(height: 60),
                    Text(StringControl.madeLove,textAlign: TextAlign.justify,style: AppTextStyle.styleText18blw300,),
                    const SizedBox(height: 10),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCall(context){

    if(emailController.text.isEmpty ) {
    locator<ToastService>().showInCenter( "Please Enter Email Address",);
    }
    else if(!EmailValidator.validate(emailController.text)) {
    locator<ToastService>().showInCenter( "Please Enter Valid Email Address",);
    }
    else if(passwordController.text.isEmpty ) {
      locator<ToastService>().showInCenter( "Please Enter Password",);
    }
    else{
      callLoginBloc();
    }
  }

  callLoginBloc(){
    BlocProvider.of<LoginBloc>(context).add(LoginRefreshEvent(
      email: emailController.text.trim(),
      password: passwordController.text.trim()
    ));
  }
}
