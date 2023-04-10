import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsca/common/custom_widget/navigation_service.dart';

import '../constant/color_constants.dart';
import '../constant/image.dart';
import '../locator/locator.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  Color? color;
  String? text;
  CustomAppbar({Key? key, this.color,this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        elevation: 0,
        actions: [
          Image.asset(ImageControl.logo,scale: 7,),
        ],
        leading: InkWell(
          onTap: () {
            locator<NavigationService>().pop();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 6,top: 6,right: 6),
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.greyLightColor,
                shape: BoxShape.circle
              ),
                child: Center(child: Icon(Icons.arrow_back_ios,color: ColorConstants.blackColor,size: 20.sp,))),
          ),
        ),
        // backgroundColor: ColorConstant.headingColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);


}
