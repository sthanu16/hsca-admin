import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';


import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/sizes.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/custom_appbar.dart';
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield.dart';
import '../add_edit_house/add_house_listing.dart';


class ExteriorsScreen extends StatefulWidget {
  const ExteriorsScreen({Key? key}) : super(key: key);

  @override
  State<ExteriorsScreen> createState() => _ExteriorsScreenState();
}

class _ExteriorsScreenState extends State<ExteriorsScreen> {

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
  StreamController dropdownController = StreamController();
  var items = ['Good', 'Fair', 'Poor', 'None', ];

  String? mentorValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: CustomAppbar(),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Text(StringControl.aboutExteriors,style: AppTextStyle.styleHeading24blw700,),
              SizedBox(height: 20.h,),
              Text(StringControl.nostrud,style: AppTextStyle.Txt13pinkw600,),

              SizedBox(height: 30.h,),
              InkWell(
                onTap: (){
                  selectImages();
                },
                child: Container(
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
                    Image.asset(ImageControl.view,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.view,style: TextStyle(),),
                    Spacer(),
                    StreamBuilder(
                      stream: dropdownController.stream,
                      builder: (context, snapshot) {
                        return Container(
                          color: ColorConstants.greyLightColor,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                borderRadius: BorderRadius.circular(20.r),
                                icon: Image.asset(ImageControl.arrowOn,scale: 4,),

                                // isDense: true,
                                // isExpanded: fas,
                                hint: Row(
                                  children: [
                                    Text(StringControl.good, style: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                                items: items
                                    .map((String items) => DropdownMenuItem(
                                    value: items,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(items,style: TextStyle(fontSize: 14.sp),),
                                    ),
                                ))
                                    .toList(),
                                onChanged: (value) {
                                  mentorValue = value;
                                  dropdownController.sink.add(value);
                                },
                                value: mentorValue,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

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
                    Image.asset(ImageControl.landscape,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.landscaping,style: TextStyle(),),
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
                    Image.asset(ImageControl.lawn,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.lawn1,style: TextStyle(),),
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
                    Image.asset(ImageControl.lawn1,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.lawn2,style: TextStyle(),),
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
                    Image.asset(ImageControl.brick,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.brick,style: TextStyle(),),
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
                    Image.asset(ImageControl.vinyl,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.vinyl,style: TextStyle(),),
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
                    Image.asset(ImageControl.house,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.deck,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 34,),

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
                    Image.asset(ImageControl.patio,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.patio,style: TextStyle(),),
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
                    Image.asset(ImageControl.garage,scale: 3,),
                    SizedBox(width: 20.w),
                    Text(StringControl.garage,style: TextStyle(),),
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
                    Image.asset(ImageControl.windows,scale: 3.5,),
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
                    Image.asset(ImageControl.door,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.doors,style: TextStyle(),),
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
                    Image.asset(ImageControl.roof,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.roof,style: TextStyle(),),
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
                    Image.asset(ImageControl.fence,scale: 4,),
                    SizedBox(width: 20.w),
                    Text(StringControl.fence,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4,),

                  ],
                ),
              ),
              SizedBox(height: 20.h,),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.experience,
                controller: messageController,
                labelText: StringControl.experience,

                prefixIcon:   Image.asset(ImageControl.messaging,scale: 3.5,),
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

  dropDown(){
    StreamBuilder(
      stream: dropdownController.stream,
      builder: (context, snapshot) {
        return Container(
          color: ColorConstants.greyLightColor,
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(20.r),
                icon:Image.asset(ImageControl.arrowOn,scale: 4,),

                // isDense: true,
                // isExpanded: fas,
                hint: Row(
                  children: [
                    Image.asset(ImageControl.building,height: 18.h,),
                    SizedBox(width: 8.w,),
                    Text(StringControl.view,
                        style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
                items: items
                    .map((String items) => DropdownMenuItem(
                  value: items,
                  child: Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Text(items,style: TextStyle(fontSize: 14.sp),),
                  ),
                ))
                    .toList(),
                onChanged: (value) {
                  mentorValue = value;
                  dropdownController.sink.add(value);
                },
                value: mentorValue,
              ),
            ),
          ),
        );
      },
    );
  }

}
