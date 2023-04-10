import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/custom_appbar.dart';
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield.dart';
import '../add_edit_house/add_house_listing.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {

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
    return  Scaffold(
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
              Text(StringControl.aboutOthers,style: AppTextStyle.styleHeading24blw700,),
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
                                  child: Image.asset(ImageControl.close,scale: 3)),
                            ),
                          )
                        ],
                      );
                    }
                ),
              ),
              SizedBox(height: 30.h,),
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
                    Image.asset(ImageControl.view,scale: 4),
                    SizedBox(width: 20.w),
                    Text(StringControl.basement,style: TextStyle(),),
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
                    Image.asset(ImageControl.landscape,scale: 4),
                    SizedBox(width: 20.w),
                    Text(StringControl.finished,style: TextStyle(),),
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
                    Image.asset(ImageControl.lawn,scale: 4),
                    SizedBox(width: 20.w),
                    Text(StringControl.garage,style: TextStyle(),),
                    Spacer(),
                    Image.asset(ImageControl.arrowOn,scale: 4),

                  ],
                ),
              ),

              SizedBox(height: 20.h,),
              CustomTextField(
                maxLines: 1,
                headingText: StringControl.experience,
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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddHouseListingScreen(),)),
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
