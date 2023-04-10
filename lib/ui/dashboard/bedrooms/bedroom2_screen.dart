import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/custom_appbar.dart';
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield.dart';

class BedroomScreen2 extends StatefulWidget {
  const BedroomScreen2({Key? key}) : super(key: key);

  @override
  State<BedroomScreen2> createState() => _BedroomScreen2State();
}

class _BedroomScreen2State extends State<BedroomScreen2> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Text(StringControl.bedroom12,style: AppTextStyle.styleHeading24blw700,),
              SizedBox(height: 20.h,),
              Text(StringControl.nostrud,style: AppTextStyle.Txt13pinkw600,),

              SizedBox(height: 30.h,),
              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: ColorConstants.navyBlueColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Image.asset(ImageControl.camera,scale: 3,),
                    SizedBox(width: 10.w,),
                    Text(StringControl.uploadPhotos,style: TextStyle(color:ColorConstants.whiteColor),)
                  ],
                ),

              ),
              SizedBox(height: 20.h,), Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorConstants.greyLightColor

                ),
                child: Row(
                  children: [
                    Image.asset(ImageControl.view,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.size,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 3,),

                  ],
                ),
              ),
              SizedBox(height: 20.h,),Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorConstants.greyLightColor

                ),
                child: Row(
                  children: [
                    Image.asset(ImageControl.view,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.carpetFloor,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 3,),

                  ],
                ),
              ),
              SizedBox(height: 20.h,),Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorConstants.greyLightColor

                ),
                child: Row(
                  children: [
                    Image.asset(ImageControl.view,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.woodFloor,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 3,),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorConstants.greyLightColor

                ),
                child: Row(
                  children: [
                    Image.asset(ImageControl.view,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.closet,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 3,),

                  ],
                ),
              ),
              SizedBox(height: 20.h,),Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorConstants.greyLightColor

                ),
                child: Row(
                  children: [
                    Image.asset(ImageControl.view,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.bathroom,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 3,),

                  ],
                ),
              ),
              SizedBox(height: 20.h,),Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorConstants.greyLightColor

                ),
                child: Row(
                  children: [
                    Image.asset(ImageControl.view,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.standing,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 3,),

                  ],
                ),
              ),
              SizedBox(height: 20.h,),Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorConstants.greyLightColor

                ),
                child: Row(
                  children: [
                    Image.asset(ImageControl.view,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.tub,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 3,),

                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                maxLines: 1,
                headingText: StringControl.experience,
                controller:messageController,
                labelText: StringControl.experience,
                prefixIcon:   Image.asset(ImageControl.view,scale: 3,),
                fillColor:ColorConstants.greyLightColor,
              ),
              SizedBox(height: 20.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: CustomButton(
                  textColor: ColorConstants.whiteColor,
                  onTap: () => (){},
                  text: StringControl.save,
                  textSize: 20.sp,
                  buttonColor: ColorConstants.greenColor,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
