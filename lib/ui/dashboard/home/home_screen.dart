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
import '../../auth/edit_profile/edit_profile_screen.dart';
import '../../result/result_screen.dart';
import '../add_edit_house/add_house_listing.dart';
import '../appliances/appliances_screen.dart';
import '../bedrooms/master_bedroom_screen.dart';
import '../community/community_screen.dart';
import '../exterior/exteriors_screen.dart';
import '../home/home_screen.dart';
import '../interior/interiors_screen.dart';
import '../kitchen/kitchen_screen.dart';
import '../other_info/other_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageControl.background),
                      fit: BoxFit.fill),
                ),

                child:  Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 60.w),
                      child: Text(
                          textAlign: TextAlign.center,
                        StringControl.profile,style: TextStyle(
                          fontSize: 18.sp,
                          color: ColorConstants.navyBlueColor
                      ),
                      ),
                    ),
                   Stack(
                     children: [
                       Container(
                         height: 90.h,
                         width: 90.w,
                         decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(
                                 color: ColorConstants.navyBlueColor
                             )
                         ),
                         child: Image.asset(ImageControl.logo,scale: 2,),
                       ),
                       Positioned(
                         bottom: 10,
                           right: 0,
                           child: InkWell(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(),));

                             },
                             child: Container(
                               height: 30.h,
                               width: 30.w,
                               decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   color: ColorConstants.navyBlueColor
                               ),child: Center(child: Image.asset(ImageControl.edit1,scale: 5,)),
                             ),
                           ),)
                     ],
                   ),
                    Text("Mathew Adam",style: AppTextStyle.styleHeading24blw700,),
                    SizedBox(height: 10.h,),
                     Text("mathew@email.com",style: AppTextStyle.styleHeading16blw700,),

                    SizedBox(height: 40.h,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddHouseListingScreen(),));
                      },
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstants.navyBlueColor
                        ),
                        child: Image.asset(ImageControl.add,scale: 4,),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text(StringControl.houseListing,style: AppTextStyle.styleHeading24blw700,),

                    SizedBox(height: 40.h,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(),));
                      },
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstants.navyBlueColor
                        ),
                        child: Image.asset(ImageControl.result,scale: 5,),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text(StringControl.results,style: AppTextStyle.styleHeading24blw700,)
                  ],
                ),
              )
            ]
        ),
      )
    );
  }
}
