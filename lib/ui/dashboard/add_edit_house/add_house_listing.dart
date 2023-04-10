import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/sizes.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/custom_appbar.dart';
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield.dart';
import '../appliances/appliances_screen.dart';
import '../bedrooms/master_bedroom_screen.dart';
import '../community/community_screen.dart';
import '../exterior/exteriors_screen.dart';
import '../home/home_screen.dart';
import '../interior/interiors_screen.dart';
import '../kitchen/kitchen_screen.dart';
import '../other_info/other_screen.dart';



class AddHouseListingScreen extends StatefulWidget {
  const AddHouseListingScreen({Key? key}) : super(key: key);

  @override
  State<AddHouseListingScreen> createState() => _AddHouseListingScreenState();
}

class _AddHouseListingScreenState extends State<AddHouseListingScreen> {
  StreamController dropdownController = StreamController();
  StreamController dropdownController1 = StreamController();
  final List<String> bedroom = ['1', '2', '3', '4', '5', '6','7'];
  final List<String> bathroom =  ['1', '2', '3', '4', '5', '6','7'];

  // var bedroom = ['1', '2', '3', '4', '5', '6','7'];
  // var bathroom = ['1', '2', '3', '4', '5', '6','7'];
  String? bedroomValue;
  String? bathroomValue;


  final TextEditingController addressController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
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
              addHeight(20.h),
              Text(StringControl.houseListing,style: AppTextStyle.styleHeading24blw700,),
              addHeight(20.h),
              Text(StringControl.nostrud,style: AppTextStyle.Txt13pinkw600,),
              addHeight(30.h),
              CustomTextField(
                maxLines: 1,
                headingText:StringControl.streetAddress,
                controller: addressController,
                labelText: StringControl.streetAddress,
                fillColor: ColorConstants.greyLightColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.address,height: 5,color: Colors.black,),
                ),
              ),
              addHeight(15.h),

              CustomTextField(
                maxLines: 1,
                headingText:StringControl.housePrice,
                controller: priceController,
                labelText: StringControl.housePrice,
                fillColor: ColorConstants.greyLightColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.dolor,height: 8.h,color: Colors.black,),
                ),
              ),

              addHeight(20.h),
              Row(
                children: [
                  Expanded(
                    child:   Container(
                      height: 60.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(color:ColorConstants.greyLightColor),
                        //color: AppColors.darkWhite
                      ),
                      child: StreamBuilder(
                        stream: dropdownController.stream,
                        builder: (context, snapshot) {
                          return Container(
                            color: ColorConstants.greyLightColor,
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(20.r),
                                  icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 30.sp),
                                  // isDense: true,
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Image.asset(ImageControl.bedroom,height: 18.h,color: ColorConstants.blackColor,),
                                      addWidth(8.w),
                                      Text(StringControl.bedrooms,
                                          style: TextStyle(fontSize: 12.sp)),
                                    ],
                                  ),
                                  items: bedroom
                                      .map((String items) => DropdownMenuItem(
                                      value: items,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(ImageControl.bedroom,height: 18.h,color: ColorConstants.blackColor,),
                                          SizedBox(width: 14.w,),
                                          Text(items,style: TextStyle(fontSize: 14.sp),),
                                        ],
                                      )))
                                      .toList(),
                                  onChanged: (value) {
                                    bedroomValue = value;
                                    dropdownController.sink.add(value);
                                  },
                                  value: bedroomValue,
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                    ),
                  ),
                  addWidth(20.w),
                  Expanded(
                    child: Container(
                      height: 60.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(color:ColorConstants.greyLightColor),
                        //color: AppColors.darkWhite
                      ),
                      child: StreamBuilder(
                        stream: dropdownController1.stream,
                        builder: (context, snapshot) {
                          return Container(
                            color: ColorConstants.greyLightColor,
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(20.r),
                                  icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 30.sp),
                                  // isDense: true,
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Image.asset(ImageControl.bathroom,height: 18.h,color: ColorConstants.blackColor,),
                                      addWidth(8.w),
                                      Text(StringControl.bathroom ,
                                          style: TextStyle(fontSize: 12.sp)),
                                    ],
                                  ),
                                  items: bathroom
                                      .map((String items1) => DropdownMenuItem(
                                      value: items1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(ImageControl.bathroom,height: 18.h,color: ColorConstants.blackColor,),
                                          addWidth(14.w),

                                          Text(items1,style: TextStyle(fontSize: 14.sp),),
                                        ],
                                      )))
                                      .toList(),
                                  onChanged: (value) {
                                    bathroomValue = value;
                                    dropdownController1.sink.add(value);
                                  },
                                  value: bathroomValue,
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                    ),
                  ),
                ],
              ),
              addHeight(20.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      height: 70.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorConstants.greyLightColor
                      ),
                      child: Row(
                        children: [
                          Image.asset(ImageControl.tax,scale: 3),
                          addWidth(20.w),

                          Expanded(
                              flex: 4,
                              child: Text(StringControl.annualTax,style: TextStyle(),)),

                        ],
                      ),
                    ),
                  ),
                  addWidth(20.w),

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      height: 70.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorConstants.greyLightColor
                      ),
                      child: Row(
                        children: [
                          Image.asset(ImageControl.ruler,scale: 3),
                          addWidth(20.w),

                          Expanded(
                              flex: 4,
                              child: Text(StringControl.areaFeet,style: TextStyle(),)),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
              addHeight(20.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      height: 70.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorConstants.greyLightColor
                      ),
                      child: Row(
                        children: [
                          Image.asset(ImageControl.tree,scale: 3),
                          addWidth(20.w),

                          const Expanded(
                              flex: 4,
                              child: Text(StringControl.neighbourhood,style: TextStyle(),)),


                        ],
                      ),
                    ),
                  ),
                  addWidth(20.w),

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      height: 70.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorConstants.greyLightColor
                      ),
                      child: Row(
                        children: [
                          Image.asset(ImageControl.calendar,scale: 3),
                          addWidth(20.w),

                          const Expanded(
                              flex: 4,
                              child: Text(StringControl.builtYear,style: TextStyle(),)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              addHeight(20.h),
              Row(
               children: [
                 Expanded(
                   child: InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ExteriorsScreen(),));
                     },
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 14.w),
                       height: 70.h,
                       width: 200.w,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.r),
                           color: ColorConstants.navyBlueColor
                       ),
                       child: Row(
                         children: [
                           Image.asset(ImageControl.exterior,scale: 3),
                           addWidth(20.w),

                           Text(StringControl.exterior,style: TextStyle(color: ColorConstants.whiteColor,),),
                           const Spacer(),
                           Image.asset(ImageControl.arrow,scale: 3),

                         ],
                       ),
                     ),
                   ),
                 ),
                 addWidth(20.w),
                 Expanded(
                   child: InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => InteriorsScreen(),));
                     },
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 14.w),
                       height: 70.h,
                       width: 200.w,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.r),
                           color: ColorConstants.navyBlueColor
                       ),
                       child: Row(
                         children: [
                           Image.asset(ImageControl.interior,scale: 3),
                           addWidth(20.w),

                           Text(StringControl.interior,style: TextStyle(color: ColorConstants.whiteColor,),),
                           const Spacer(),
                           Image.asset(ImageControl.arrow,scale: 3),

                         ],
                       ),
                     ),
                   ),
                 ),
               ],
             ),
              addHeight(20.h),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const KitchenScreen(),));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        height: 70.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ColorConstants.navyBlueColor
                        ),
                        child: Row(
                          children: [
                            Image.asset(ImageControl.kitchen,scale: 3),
                            addWidth(20.w),
                            Text(StringControl.kitchen,style: TextStyle(color: ColorConstants.whiteColor,),),
                            const Spacer(),
                            Image.asset(ImageControl.arrow,scale: 3),

                          ],
                        ),
                      ),
                    ),
                  ),
                  addWidth(20.w),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MasterBedroomScreen(),));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        height: 70.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ColorConstants.navyBlueColor
                        ),
                        child: Row(
                          children: [
                            Image.asset(ImageControl.bedroom,scale: 3),
                            addWidth(20.w),
                            const Expanded(
                              flex: 4,
                                child: Text(StringControl.bedrooms,style: TextStyle(color: ColorConstants.whiteColor,),)),
                            const Spacer(),
                            Image.asset(ImageControl.arrow,scale: 3),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              addHeight(20.h),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AppliancesScreen(),));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        height: 70.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ColorConstants.navyBlueColor
                        ),
                        child: Row(
                          children: [
                            Image.asset(ImageControl.appliances,scale: 3),
                            addWidth(20.w),
                            const Expanded(
                              flex: 4,
                                child: Text(StringControl.appliances,style: TextStyle(color: ColorConstants.whiteColor,),)),
                            const Spacer(),
                            Image.asset(ImageControl.arrow,scale: 3),

                          ],
                        ),
                      ),
                    ),
                  ),
                  addWidth(20.w),

                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OtherScreen(),));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        height: 70.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ColorConstants.navyBlueColor
                        ),
                        child: Row(
                          children: [
                            Image.asset(ImageControl.other,scale: 3),
                            addWidth(20.w),
                            Text(StringControl.others,style: TextStyle(color: ColorConstants.whiteColor,),),
                            const Spacer(),
                            Image.asset(ImageControl.arrow,scale: 3),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              addHeight(20.h),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CommunityScreen(),));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        height: 70.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ColorConstants.navyBlueColor
                        ),
                        child: Row(
                          children: [
                            Image.asset(ImageControl.community,scale: 3),
                            addWidth(20.w),
                            const Expanded(
                              flex: 3,
                                child: Text(StringControl.community,style: TextStyle(color: ColorConstants.whiteColor,),)),
                            const Spacer(),
                            Image.asset(ImageControl.arrow,scale: 3),

                          ],
                        ),
                      ),
                    ),
                  ),
                  addWidth(20.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      height: 70.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorConstants.whiteColor
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w,vertical:25.h),
                child: CustomButton(
                  textColor: ColorConstants.whiteColor,
                  onTap: () => _showBottomShareSheet(context),
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => AddHouseListingScreen())),
                  text: StringControl.submit,
                  textSize: 24.sp,
                  buttonColor: ColorConstants.greenColor,
                ),
              ),
              addHeight(30.h),
            ],
          ),
        ),
      ),
    );
  }
  _showBottomShareSheet(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40.r),
          )),
      builder: (context) => SafeArea(
        child: Container(
          height: 350.h,
          padding: EdgeInsets.symmetric(
            horizontal: 21.w,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addHeight(20.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 3.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: ColorConstants.blueColor,

                        ),
                      ),
                    ),
                    addHeight(20.h),
                    Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstants.greenColor
                      ),
                      child: Image.asset(ImageControl.check,scale: 4,),
                    ),
                    addHeight(20.h),
                    Text(StringControl.successfully,style: AppTextStyle.styleHeading24blw700,),
                    addHeight(10.h),
                    Text(StringControl.submitted,style: AppTextStyle.styleHeading24blw700,),
                    addHeight(20.h),
                    Text("Lorem ipsum dolor sit amet, consectetur.",style: AppTextStyle.styleHeading14blw700,),
                    addHeight(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: CustomButton(
                        textColor: ColorConstants.whiteColor,
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen())),
                        text: StringControl.backHome,
                        textSize: 20.sp,
                        buttonColor: ColorConstants.greenColor,
                      ),
                    ),
                  ],
                ),
                addHeight(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
