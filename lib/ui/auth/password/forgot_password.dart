import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hsca/common/constant/color_constants.dart';

import '../../../bloc/forgot_password_bloc.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield.dart';
import '../../../common/custom_widget/custom_textfield_web.dart';
import '../../../common/custom_widget/navigation_service.dart';
import '../../../common/locator/locator.dart';
import '../../../common/router/router.gr.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

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
              decoration:    BoxDecoration(
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
                    Text(StringControl.forgotPassword,textAlign: TextAlign.justify,
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

                   const SizedBox(height: 40),

                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(listener: (context, state) {
                          if (state is ForgotPasswordSuccessState) {
                            Fluttertoast.showToast(
                                msg: state.forgotPasswordModel?.message??""
                            );
                            locator<NavigationService>().push(const LoginScreenRoute());
                          } else if (state is ForgotPasswordErrorState) {
                            Fluttertoast.showToast(
                              msg: state.error,
                            );
                          } else {}
                        }, builder: (context, state) {
                          if (state is ForgotPasswordLoadingState) {
                            return const CircularProgressIndicator();
                          } else {
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
                                text: StringControl.confirm,
                                textSize: 20.sp,
                                buttonColor: ColorConstants.greenColor,
                              ),
                            );
                          }
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );








      Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 17.w,vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 150.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontSize: 22.sp,

                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: width*0.4,
                child: CustomTextField(
                  controller: emailController,
                  maxLength: 50,
                  headingText: StringControl.email,
                  labelText: StringControl.enterEmail,
                ),
              ),

              SizedBox(
                height: 60.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(listener: (context, state) {
                    if (state is ForgotPasswordSuccessState) {
                      Fluttertoast.showToast(
                        msg: state.forgotPasswordModel?.message??""
                      );
                      locator<NavigationService>().push(const LoginScreenRoute());
                    } else if (state is ForgotPasswordErrorState) {
                      Fluttertoast.showToast(
                        msg: state.error,
                      );
                    } else {}
                  }, builder: (context, state) {
                    if (state is ForgotPasswordLoadingState) {
                      return const CircularProgressIndicator();
                    } else {
                      return SizedBox(
                        width: width*0.3,
                        child: CustomButton(
                          textColor: ColorConstants.whiteColor,
                          onTap: () => onCall(context),
                          text: "Confirm",
                          textSize: 18.sp,
                          buttonColor: ColorConstants.greenColor,
                        ),
                      );
                    }
                  }),
                ),
              ),

              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void onCall(context) {
    if(emailController.text.isEmpty ) {
      Fluttertoast.showToast(
        msg: "Please Enter Email Address",
      );
    }
    else if(!EmailValidator.validate(emailController.text)) {
      Fluttertoast.showToast(
        msg: "Please Enter Valid Email Address",
      );
    }else{
     BlocProvider.of<ForgotPasswordBloc>(context).add(ForgotPasswordButtonEvent(emailController.text.trim()));
    }

  }
}
