import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/custom_appbar.dart';
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield.dart';
import '../add_edit_house/add_house_listing.dart';

class InteriorsScreen extends StatefulWidget {
  const InteriorsScreen({Key? key}) : super(key: key);

  @override
  State<InteriorsScreen> createState() => _InteriorsScreenState();
}

class _InteriorsScreenState extends State<InteriorsScreen> {
  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];


  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {
    });
  }
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
              Text(StringControl.interiors,style: AppTextStyle.styleHeading24blw700,),
              SizedBox(height: 20.h,),
              Text(StringControl.nostrud,style: AppTextStyle.Txt13pinkw600,),

              SizedBox(height: 30.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: imageFileList!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 30
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.file(File(imageFileList![index].path), fit: BoxFit.cover)
                          ),
                          Positioned(
                            right: -5,
                            top:-5,
                            child: Container(
                              height: 25.h,
                              width:30.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorConstants.navyBlueColor
                              ),
                              child: InkWell(
                                  onTap:(){
                                    imageFileList?.removeAt(index);
                                    setState(() {});
                                  },
                                  child: Image.asset(ImageControl.close,scale: 3,)),
                            ),
                          )
                        ],
                      );
                    }
                ),
              ),
              InkWell(
                onTap: (){
                  selectImages();
                },
                child: Container(
                  height: 55.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: ColorConstants.greyLightColor
                  ),
                  child: Image.asset(ImageControl.add,scale: 5,color: ColorConstants.blackColor,),

                ),
              ),
              SizedBox(height: 20.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorConstants.greyLightColor

                ),
                child: Row(
                  children: [
                    Image.asset(ImageControl.view,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.wall,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4,),

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
                    Image.asset(ImageControl.landscape,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.trim,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4,),

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
                    Image.asset(ImageControl.lawn,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.windows,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4,),

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
                    Image.asset(ImageControl.lawn1,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.flooring,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4,),

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
                    Image.asset(ImageControl.brick,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.stairs,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4,),

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
                    Image.asset(ImageControl.vinyl,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.living,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4,),

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
                    Image.asset(ImageControl.house,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.size,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4,),

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
                    Image.asset(ImageControl.patio,scale: 4),
                    SizedBox(width: 20.w),
                    Text(StringControl.carpet,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4),

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
                    Image.asset(ImageControl.garage,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.wood,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4,),

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
                    Image.asset(ImageControl.windows,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.familyRoom),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4,),

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
                    Image.asset(ImageControl.door,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.size,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4,),

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
                    Image.asset(ImageControl.roof,scale: 4),
                    SizedBox(width: 20.w),
                    Text(StringControl.carpet,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4),

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
                    Image.asset(ImageControl.fence,scale: 4),
                    SizedBox(width: 20.w),
                    Text(StringControl.wood,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4),

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
                    Image.asset(ImageControl.fence,scale: 4),
                    SizedBox(width: 20.w),
                    Text(StringControl.diningRoom,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4),

                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                maxLines: 1,
                controller:messageController,
               labelText: StringControl.experience,
                prefixIcon:   Image.asset(ImageControl.messaging,scale: 4),
                fillColor:ColorConstants.greyLightColor,
              ),
              SizedBox(height: 20.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: CustomButton(
                  textColor: ColorConstants.whiteColor,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddHouseListingScreen(),)),
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
