import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsca/common/constant/color_constants.dart';
import 'package:hsca/common/constant/sizes.dart';
import 'package:hsca/common/constant/text_style_common.dart';
import '../../../common/constant/loader_dialog.dart';
import '../../../common/constant/string.dart';
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield.dart';
import '../../../common/custom_widget/navigation_service.dart';
import '../../../common/custom_widget/toast_service.dart';
import '../../../common/locator/locator.dart';
import 'bloc/change_password_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {


  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: height*0.9,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Form(
          key: authFormKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorConstants.themeColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                    child: Text(StringControl.changePassword,style: AppTextStyle.styleContainer20Blackw600),
                  ),
                ),
                addHeight(50),
                Center(
                  child: SizedBox(
                    width: width*0.3,
                    child: CustomTextField(
                      maxLines: 1,
                      colors: ColorConstants.themeColor,
                      controller: oldPassController,
                      labelText: StringControl.enterOldPassword,
                      headingText: StringControl.oldPassword,
                      fillColor: ColorConstants.greyLightColor,
                      color: ColorConstants.themeColor,
                      obscureText: true,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Old Password";
                        }
                      },
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: width*0.3,
                    child:  CustomTextField(
                      maxLines: 1,
                      colors: ColorConstants.themeColor,
                      controller: newPassController,
                      labelText: StringControl.enterNewPassword,
                      headingText: StringControl.newPassword,
                      fillColor: ColorConstants.greyLightColor,
                      obscureText: true,
                      color: ColorConstants.themeColor,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: width*0.3,
                    child:  CustomTextField(
                      maxLines: 1,
                      colors: ColorConstants.themeColor,
                      controller: confirmPassController,
                      labelText: StringControl.enterConfirmPassword,
                      headingText: StringControl.confirmPassword,
                      obscureText: true,
                      fillColor: ColorConstants.greyLightColor,
                      color: ColorConstants.themeColor,
                    ),
                  ),
                ),
                addHeight(40),
                BlocListener<ChangePasswordBloc,ChangePasswordState>(
                  listener: (context, state) async{
                    if(state is ChangePasswordLoadingState){
                      locator<DialogService>().showLoader();
                    }else if (state is ChangePasswordSuccessState){
                      clearFields();
                      locator<DialogService>().hideLoader();
                      locator<ToastService>().showInCenter(
                        state.data.message ?? "",
                      );
                    }
                    else if(state is ChangePasswordErrorState){
                      locator<DialogService>().hideLoader();
                      locator<ToastService>().showInCenter(
                       state.error,
                      );
                    }
                  },
                  child: Center(
                    child: SizedBox(
                      width: width*0.2,
                      child: CustomButton(
                        textColor: ColorConstants.whiteColor,
                        onTap: () => {
                          onCall(context),
                        },
                        //    Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardScreen())),
                        //   onCall(context),
                        text: StringControl.changePassword,
                        textSize: 20.sp,
                        buttonColor: ColorConstants.greenColor,
                      ),
                    ),
                  ),
                ),
               
                addHeight(40),
              ],

            ),
          ),
        ),
      ),
    );
  }

  void onCall(context){

    if(oldPassController.text.isEmpty ) {
      locator<ToastService>().showInCenter( "Please Enter Old Password",);
    }
    else if(newPassController.text.isEmpty ) {
      locator<ToastService>().showInCenter( "Please Enter New Password",);
    }
    else if(confirmPassController.text.isEmpty ) {
      locator<ToastService>().showInCenter( "Please ReEnter Password",);
    }
    else if(newPassController.text.trim() != confirmPassController.text.trim()) {
      locator<ToastService>().showInCenter( "Password not match",);
    }
    else{
      BlocProvider.of<ChangePasswordBloc>(context)
          .add(ChangePasswordRefreshEvent(oldPassword: oldPassController.text.trim(),newPassword: newPassController.text.trim()));
    }
  }

  clearFields(){
    oldPassController.clear();
    newPassController.clear();
    confirmPassController.clear();
  }




}
