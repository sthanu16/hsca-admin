import 'package:cached_network_image/cached_network_image.dart';
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

import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../common/constant/color_constants.dart';
import '../../common/constant/image.dart';
import '../../common/constant/sizes.dart';
import '../../common/custom_widget/custom_appbar.dart';
import '../../common/custom_widget/navigation_service.dart';
import '../../common/locator/locator.dart';
import '../dashboard/add_edit_house/add_house_listing.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
              Text(StringControl.yourResults,style: AppTextStyle.styleHeading24blw700,),
              SizedBox(height: 20.h,),
              Text(StringControl.nostrud,style: AppTextStyle.Txt13pinkw600,),
              SizedBox(height: 50.h,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 10.h),
                    child: Container(
                      padding: EdgeInsets.only(left: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: ColorConstants.greyLightColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 18.w,left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 6.0,
                               percent: 0.7,
                               center: Text("93%",style: AppTextStyle.styleText24blw700,),
                              progressColor: ColorConstants.navyBlueColor,

                            ),
                            addWidth(10.w),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(ImageControl.location,color: ColorConstants.navyBlueColor,scale: 5,),
                                    addWidth(4.w),

                                    Text("11 Mission Compound,  Devi Niketan, near chomu house circle, C Scheme, Jaipur, Rajasthan 302001")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => const AddHouseListingScreen(),));
                                      },
                                      child: Container(
                                          height: 35.h,
                                          width: 35.w,
                                          decoration: const BoxDecoration(
                                              color: ColorConstants.navyBlueColor,
                                              shape: BoxShape.circle
                                          ),
                                          child: Image.asset(ImageControl.edit,scale: 3,)
                                      ),
                                    ),
                                    addWidth(8.w),
                                    InkWell(
                                      onTap: (){
                                        _showDeactivateAccountDialog();
                                      },
                                      child: Container(
                                          height: 35.h,
                                          width: 35.w,
                                          decoration: const BoxDecoration(
                                              color: ColorConstants.navyBlueColor,
                                              shape: BoxShape.circle
                                          ),
                                          child: Image.asset(ImageControl.delete,scale: 4,)
                                      ),
                                    ),
                                  ],
                                ),
                              addHeight(5.h)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<dynamic> _showDeactivateAccountDialog(){
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (dialogContext, setState) {
            return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.white,
                child: SizedBox(
                  height: 220.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstants.redColor
                        ),
                        child: Image.asset(ImageControl.delete,scale: 2,color: ColorConstants.whiteColor),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        StringControl.areYouSure,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.styleHeading24blw700,
                      ),
                      SizedBox(height: 16.h,),
                      Text(
                        StringControl.deleteAccount,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.styleHeading12blw700.copyWith(color: ColorConstants.blueColor),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap:(){
                                locator<NavigationService>().pop();
                              },
                              child: Container(
                                height: 40.h,
                                width: 110.w,
                                decoration:  BoxDecoration(
                                  color: ColorConstants.btnColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                ),
                                child:Center(child: Text(StringControl.cancel,style: AppTextStyle.styleHeading20blw700.copyWith(color: ColorConstants.whiteColor,)

                                )),
                              ),
                            ),
                            Container(
                              height: 40.h,
                              width: 110.w,
                              decoration: BoxDecoration(
                                color: ColorConstants.darkRedColor,
                                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                              ),
                              child: Center(child: Text(StringControl.delete,
                                  style: AppTextStyle.styleHeading20blw700.copyWith(color: ColorConstants.whiteColor,))
                              ),
                            )],

                        ),
                      ),
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
