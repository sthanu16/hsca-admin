import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsca/common/custom_widget/navigation_service.dart';
import 'package:hsca/common/custom_widget/toast_service.dart';
import 'package:hsca/ui/dashboard/settings/bloc/app_update_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/loader_dialog.dart';
import '../../../common/constant/sizes.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield.dart';
import '../../../common/locator/locator.dart';
import 'model/app_update_model.dart';

class SoftWareUpdateScreen extends StatefulWidget {
  const SoftWareUpdateScreen({Key? key}) : super(key: key);

  @override
  State<SoftWareUpdateScreen> createState() => _SoftWareUpdateScreenState();
}

class _SoftWareUpdateScreenState extends State<SoftWareUpdateScreen> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController description1Controller = TextEditingController();
  final TextEditingController versionCodeController = TextEditingController();
  final TextEditingController versionCode1Controller = TextEditingController();
  final TextEditingController versionNameController = TextEditingController();
  final TextEditingController versionName1Controller = TextEditingController();
  final TextEditingController packageAndroidController = TextEditingController();
  final TextEditingController packageIosController = TextEditingController();

  bool forceAndroid = false;
  bool forceIos = false;

  bool isLoaded = true;

@override
  void initState() {
       BlocProvider.of<AppUpdateBloc>(context).add(GetAppUpdateDataEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppUpdateBloc, AppUpdateState>(
        listener: ( context1,userState){
          if(userState is AppUpdateLoadingState){
            locator<DialogService>().showLoader();
          }
          else if(userState is GetAppUpdateDataSuccessState) {
            locator<DialogService>().hideLoader();
            if (isLoaded) {
              versionCodeController.text =
              '${userState.appUpdateModel?.data?.appUpdate?.android
                  ?.versionCode}';
              packageAndroidController.text =
              '${userState.appUpdateModel?.data?.appUpdate?.android
                  ?.packageName}';
              descriptionController.text =
              '${userState.appUpdateModel?.data?.appUpdate?.android
                  ?.description}';
              if (userState.appUpdateModel?.data?.appUpdate?.android
                  ?.forceUpdate == 1) {
                forceAndroid = true;
              } else {
                forceAndroid = false;
              }

              versionCode1Controller.text =
              '${userState.appUpdateModel?.data?.appUpdate?.ios?.versionCode}';
              packageIosController.text =
              '${userState.appUpdateModel?.data?.appUpdate?.ios?.packageName}';
              description1Controller.text =
              '${userState.appUpdateModel?.data?.appUpdate?.ios?.description}';
              if (userState.appUpdateModel?.data?.appUpdate?.ios?.forceUpdate ==
                  1) {
                forceIos = true;
              } else {
                forceIos = false;
              }

              isLoaded = false;
            }
          }
          else if(userState is AppUpdateSuccessState){
            locator<DialogService>().hideLoader();
          }
          else if(userState is AppUpdateErrorState){
            locator<DialogService>().hideLoader();
            locator<ToastService>().showInCenter(userState.error);
          }

        },
        builder: (context2, userState){
          if(userState is ShowShimmerLoadingState){
            return Container(
              padding: const EdgeInsets.all(15.0),
              height: height*0.9,
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: ListView.builder(
                      itemBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 48.0,
                              height: 48.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    height: 30.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      itemCount: 6,
                    ),
                  ),
                ),
              ),
            );
          }
          else{
            return Container(
              padding: const EdgeInsets.all(15.0),
              height: height*0.9,
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          child: Text(StringControl.softwareUpdate,style: AppTextStyle.styleContainer20Blackw600),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(ImageControl.android,scale: 3,),
                                          addWidth(5),
                                          Text(StringControl.android,style: AppTextStyle.styleContainer20Blackw600.copyWith(color: ColorConstants.themeColor)),
                                        ],
                                      ),
                                      addHeight(20),
                                      Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: ColorConstants.greyLightColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(StringControl.forceUpdate,style: AppTextStyle.btnTxt15Grayw500.copyWith(color: ColorConstants.themeColor,fontSize: 16),),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(3),
                                                      color: ColorConstants.checkColor
                                                  ),
                                                  child: Checkbox(
                                                    checkColor: ColorConstants.whiteColor,
                                                    activeColor: ColorConstants.themeColor,
                                                    shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(3)),
                                                    ),
                                                    value: forceAndroid,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        forceAndroid = value!;
                                                      });
                                                      // BlocProvider.of<AppUpdateBloc>(context).add(IsAndroidForceCheckBoxEvent(value ?? false));
                                                    },
                                                  )
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      addHeight(15),
                                      CustomTextField(
                                        maxLines: 1,
                                        colors: ColorConstants.themeColor,
                                        controller: versionCodeController,
                                        labelText: StringControl.enterVersionCode,
                                        headingText: StringControl.versionCode,
                                        fillColor: ColorConstants.greyLightColor,
                                        color: ColorConstants.themeColor,
                                      ),
                                      addHeight(15),
                                      CustomTextField(
                                        maxLines: 1,
                                        colors: ColorConstants.themeColor,
                                        controller: versionNameController,
                                        labelText: StringControl.enterVersionName,
                                        headingText: StringControl.versionName,
                                        fillColor: ColorConstants.greyLightColor,
                                        color: ColorConstants.themeColor,
                                      ),
                                      addHeight(15),
                                      CustomTextField(
                                        maxLines: 1,
                                        colors: ColorConstants.themeColor,
                                        controller: packageAndroidController,
                                        labelText: StringControl.enterPackageName,
                                        headingText: StringControl.packageName,
                                        fillColor: ColorConstants.greyLightColor,
                                        color: ColorConstants.themeColor,
                                      ),
                                      addHeight(15),
                                      CustomTextField(
                                        maxLines: 5,
                                        colors: ColorConstants.themeColor,
                                        controller: descriptionController,
                                        labelText: StringControl.enterDescription,
                                        headingText: StringControl.description,
                                        fillColor: ColorConstants.greyLightColor,
                                        color: ColorConstants.themeColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:  const EdgeInsets.all(25.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(ImageControl.apple,scale: 3,),
                                            Text(StringControl.ios,style: AppTextStyle.styleContainer20Blackw600.copyWith(color: ColorConstants.themeColor)),
                                          ],
                                        ),
                                      ),
                                      addHeight(20),
                                      Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: ColorConstants.greyLightColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(StringControl.forceUpdate,style: AppTextStyle.btnTxt15Grayw500.copyWith(color: ColorConstants.themeColor,fontSize: 16),),
                                              Checkbox(
                                                checkColor: ColorConstants.whiteColor,
                                                activeColor: ColorConstants.themeColor,
                                                shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(3)),
                                                ),
                                                value: forceIos,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    forceIos = value!;
                                                  });
                                                },
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      addHeight(15),
                                      CustomTextField(
                                        maxLines: 1,
                                        colors: ColorConstants.themeColor,
                                        controller: versionCode1Controller,
                                        labelText: StringControl.enterVersionCode,
                                        headingText: StringControl.versionCode,
                                        fillColor: ColorConstants.greyLightColor,
                                        color: ColorConstants.themeColor,
                                      ),
                                      addHeight(15),
                                      CustomTextField(
                                        maxLines: 1,
                                        colors: ColorConstants.themeColor,
                                        controller: versionName1Controller,
                                        labelText: StringControl.enterVersionName,
                                        headingText: StringControl.versionName,
                                        fillColor: ColorConstants.greyLightColor,
                                        color: ColorConstants.themeColor,
                                      ),
                                      addHeight(15),

                                      CustomTextField(
                                        maxLines: 1,
                                        colors: ColorConstants.themeColor,
                                        controller: packageIosController,
                                        labelText: StringControl.enterPackageName,
                                        headingText: StringControl.packageName,
                                        fillColor: ColorConstants.greyLightColor,
                                        color: ColorConstants.themeColor,
                                      ),
                                      addHeight(15),
                                      CustomTextField(
                                        maxLines: 5,
                                        colors: ColorConstants.themeColor,
                                        controller: description1Controller,
                                        labelText: StringControl.enterDescription,
                                        headingText: StringControl.description,
                                        fillColor: ColorConstants.greyLightColor,
                                        color: ColorConstants.themeColor,
                                      ),
                                    ],
                                  ),
                                ),)
                            ],
                          ),
                          addHeight(15),
                          BlocListener<AppUpdateBloc,AppUpdateState>(
                            listener: (context, state) async{
                              if(state is AppUpdateLoadingState){
                                locator<DialogService>().showLoader();
                              }else if (state is AppUpdateSuccessState){
                                //  clearFields();
                                locator<DialogService>().hideLoader();
                                locator<ToastService>().showInCenter(
                                  "Success",
                                );
                              }
                              else if(state is AppUpdateErrorState){
                                locator<DialogService>().hideLoader();
                                locator<ToastService>().showInCenter(state.error);
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
                                  text: StringControl.submit,
                                  textSize: 20.sp,
                                  buttonColor: ColorConstants.greenColor,
                                ),
                              ),
                            ),
                          ),
                          addHeight(15),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      });

  }


  onCall(BuildContext context){
    if(versionCodeController.text.isEmpty || versionCode1Controller.text.isEmpty){
      locator<ToastService>().showInCenter( 'Please fill Version');
    }else if(versionNameController.text.isEmpty || versionName1Controller.text.isEmpty){
      locator<ToastService>().showInCenter( 'Please fill Version Name');
    }
    else if(packageAndroidController.text.isEmpty || packageIosController.text.isEmpty){
      locator<ToastService>().showInCenter( 'Please fill Package Name');
    }else if(description1Controller.text.isEmpty || descriptionController.text.isEmpty){
      locator<ToastService>().showInCenter( 'Please fill Description');
    }else{
      AppUpdateModel appModel = AppUpdateModel(
        androidCode: int.parse(versionCodeController.text.trim()),
        iosPackageName: packageIosController.text.trim(),
        androidPackageName: packageAndroidController.text.trim(),
        androidVersion: versionNameController.text.trim(),
        androidDescription: descriptionController.text.trim(),
        forceAndroidUpdate: forceAndroid?1:0,
        forceIosUpdate: forceIos?1:0,
        iosCode:int.parse(versionCode1Controller.text.trim()),
        iosDescription: description1Controller.text.trim(),
        iosVersion: versionName1Controller.text.trim() ,
      );
      BlocProvider.of<AppUpdateBloc>(context).add(AppUpdateRefreshEvent(appModel));
    }
  }

  clearFields(){
      forceAndroid=false;
      forceIos=false;
     descriptionController.clear();
     description1Controller.clear();
     versionCodeController.clear();
     versionCode1Controller.clear();
      versionNameController.clear();
      versionName1Controller.clear();
      packageAndroidController.clear();
     packageIosController.clear();
  }
}
