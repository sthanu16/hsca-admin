import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/custom_appbar.dart';
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield.dart';
import '../../../common/custom_widget/toast_service.dart';
import '../../../common/locator/locator.dart';
import '../../dashboard/add_edit_house/add_house_listing.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController realtorNumberController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController addressController1 = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController homePhoneController = TextEditingController();
  final TextEditingController cellPhoneController = TextEditingController();
  final TextEditingController priceMinController = TextEditingController();
  final TextEditingController priceMaxController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();

  StreamController dropdownController = StreamController();
  var items = [ 'Detach', 'Semi', 'Row', 'Condo', 'others'];
  String? building = "";

  String countyName = "Country";
  String countyFlag = "";

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
              Text(StringControl.editProfile,style: AppTextStyle.styleHeading24blw700,),
              SizedBox(height: 20.h,),
              Text(StringControl.nostrud,style: AppTextStyle.Txt13pinkw600,),
              SizedBox(height: 20.h,),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.realtorRegistrationNumber)),
              SizedBox(height: 15.h,),
              CustomTextField(
                maxLines: 1,
                headingText: StringControl.realtorRegistrationNumber,
                controller: realtorNumberController,
                labelText: StringControl.realtorRegistrationNumber,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
                  child: Image.asset(ImageControl.relater,scale: 3),
                ),
                fillColor: ColorConstants.greyLightColor,
              ),
              SizedBox(height: 15.h,),

              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.firstName)),
              SizedBox(height: 15.h,),
              CustomTextField(
                maxLines: 1,
                headingText: StringControl.firstName,
                controller: firstNameController,
                labelText: StringControl.firstName,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
                  child: Image.asset(ImageControl.user,scale: 3),
                ),
                fillColor: ColorConstants.greyLightColor,
              ),
              SizedBox(height: 15.h,),

              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.lastName)),
              SizedBox(height: 15.h,),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.lastName,
                controller: lastNameController,
                labelText: StringControl.lastName,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.user,scale: 3),
                ),
                fillColor: ColorConstants.greyLightColor,
              ),
              SizedBox(height: 15.h,),

              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.age)),
              SizedBox(height: 15.h,),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.age,
                controller: ageController,
                labelText: StringControl.age,
                keyboardType: TextInputType.number,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.user,scale: 3),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),

                ],

                fillColor: ColorConstants.greyLightColor,
              ),
              SizedBox(height: 15.h,),

              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.email)),
              SizedBox(height: 15.h,),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.email,
                controller: emailController,
                labelText: StringControl.email,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.email,scale: 4),
                ),

                fillColor: ColorConstants.greyLightColor,
              ),
              SizedBox(height: 15.h,),

              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.addressLine1)),
              SizedBox(height: 15.h,),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.addressLine1,
                controller: addressController,
                labelText: StringControl.addressLine1,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.location,scale: 4),
                ),
                fillColor: ColorConstants.greyLightColor,
              ),
              SizedBox(height: 15.h,),

              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.addressLine2)),
              SizedBox(height: 15.h,),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.addressLine2,
                controller: addressController1,
                labelText: StringControl.addressLine2,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.location,scale: 4),
                ),

                fillColor: ColorConstants.greyLightColor,
              ),

              SizedBox(height: 15.h,),

              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.city)),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorConstants.greyLightColor
                      ),
                      child:  CustomTextField(
                        maxLines: 1,
                        // headingText: StringControl.city,
                        controller: cityController,
                        labelText: StringControl.city,
                        prefixIcon: Image.asset(ImageControl.building,scale: 4,),

                        fillColor: ColorConstants.greyLightColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorConstants.greyLightColor
                      ),
                      child:  CustomTextField(
                        maxLines: 1,
                        controller: pinCodeController,
                        labelText: StringControl.postal,
                        fillColor: ColorConstants.greyLightColor,
                        keyboardType: TextInputType.number,
                        prefixIcon: Image.asset(ImageControl.zip,scale: 4,),

                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),

                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15.h,),

              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.state)),
              SizedBox(height: 15.h,),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.state,
                controller: stateController,
                labelText: StringControl.state,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.earth,scale: 4,),
                ),
                fillColor: ColorConstants.greyLightColor,
              ),
              SizedBox(height: 15.h,),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.country)),
              SizedBox(height: 15.h,),

              InkWell(
                onTap: (){
                  showCountryPicker(
                    context: context,
                    showPhoneCode: true,
                    onSelect: (Country country) {
                      setState(() {
                        countyFlag = country.flagEmoji;
                        countyName = country.name;
                      });
                    },
                  );
                },
                child: Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                      color:ColorConstants.greyLightColor,
                      // border: Border.all(color: AppColors.colorTextDark),
                      borderRadius: BorderRadius.circular(2.r)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 10.w),
                      Text(countyFlag),
                      SizedBox(width: 10.w,),
                      Row(
                        children: [
                          Image.asset(ImageControl.earth,scale: 4,),
                          SizedBox(width: 12.w,),
                          Text(countyName),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Image.asset(ImageControl.arrowOn,scale: 4)
                )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h,),

              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.homePhone)),
              SizedBox(height: 15.h,),
              CustomTextField(
                maxLines: 1,
                headingText: StringControl.homePhone,
                controller: homePhoneController,
                labelText: StringControl.homePhone,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.phone,scale: 3),
                ),
                fillColor: ColorConstants.greyLightColor,
              ),
              SizedBox(height: 15.h,),

              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.cellPhone)),
              SizedBox(height: 15.h,),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.cellPhone,
                controller: cellPhoneController,
                labelText: StringControl.cellPhone,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.phone,scale: 3),
                ),
                fillColor: ColorConstants.greyLightColor,
              ),
              SizedBox(height: 15.h,),

              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(StringControl.buildingType)),
              SizedBox(height: 15.h,),

              Container(
                height: 50.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color:ColorConstants.greyLightColor),
                    color: ColorConstants.greyLightColor
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                  child: DropdownButton<dynamic>(
                    icon: Image.asset(ImageControl.arrowOn,scale: 4,),
                    hint: building == ''
                        ? Row(
                      children: [
                        Image.asset(ImageControl.building,height: 18.h,),
                        SizedBox(width: 10.w,),
                        Text(StringControl.buildingType,

                        ),
                      ],
                    )
                        : Row(
                      children: [
                        Image.asset(ImageControl.building,height: 18.h,),
                        SizedBox(width: 10.w,),
                        Text(building ?? '',

                        ),
                      ],
                    ),
                    items: items
                        .map((value) {
                      return DropdownMenuItem<dynamic>(
                        onTap: (){
                          buildingController.text;
                        },
                        value: value,
                        child:
                        Row(
                          children: [
                            Image.asset(ImageControl.building,height: 18.h,),
                            SizedBox(width: 10.w,),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(
                            () {
                          building = val;
                        },
                      );
                    },
                    isExpanded: true,
                    underline: SizedBox(),
                  ),
                ),



              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorConstants.greyLightColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(ImageControl.dolor,scale: 3,),
                          SizedBox(width: 20.w,),
                          Padding(
                            padding: EdgeInsets.only(top:5.r),
                            child: Text(StringControl.budget),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h,),

                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    maxLines: 1,
                                    obscureText: true,
                                    headingText: StringControl.minimumPrice,
                                    controller: priceMinController,
                                    keyboardType: TextInputType.phone,
                                    labelText: StringControl.minimumPrice,
                                    fillColor: ColorConstants.navyBlueColor,
                                    color: ColorConstants.whiteColor,
                                  ),
                                ),
                                SizedBox(width: 10.w,),
                                Expanded(
                                  child: CustomTextField(
                                    maxLines: 1,
                                    obscureText: true,
                                    controller: priceMaxController,
                                    keyboardType: TextInputType.phone,
                                    labelText: StringControl.maximumPrice,
                                    headingText: StringControl.maximumPrice,
                                    fillColor: ColorConstants.navyBlueColor,
                                    color: ColorConstants.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w,vertical:25.h),
                child: CustomButton(
                  textColor: ColorConstants.whiteColor,
                  onTap: () => onCall(context),
                  text: StringControl.update,
                  textSize: 24.sp,
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
  void onCall(context) {
    print(realtorNumberController.text);
    print(firstNameController.text);
    print(lastNameController.text);
    print(ageController.text);
    print(emailController.text);
    print(addressController.text);
    print(addressController1.text);
    print(cityController.text);
    print(pinCodeController.text);
    print(stateController.text);
    print(homePhoneController.text);
    print(cellPhoneController.text);
    print(priceMinController.text);
    print(priceMaxController.text);
    print(buildingController.text);
    if(realtorNumberController.text.isEmpty ) {
      locator<ToastService>().showInCenter( "Please Enter Realtor Number");
    }
    else if(firstNameController.text.isEmpty ) {
      locator<ToastService>().showInCenter( "Please Enter First Name");
    }
    else if(lastNameController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Last Name");
    }
    else if(ageController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Age",);
    }
    else if(emailController.text.isEmpty ) {
      locator<ToastService>().showInCenter( "Please Enter Email Address");
    }
    else if(!EmailValidator.validate(emailController.text)) {
      locator<ToastService>().showInCenter( "Please Enter Valid Email Address");
    }
    else if(addressController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Address");
    }
    else if(addressController1.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Address");
    }
    else if(cityController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter City");
    }
    else if(stateController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter State");
    }
    else if(pinCodeController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Pin Code");
    }
    else if(homePhoneController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Phone Number");
    }
    else if(cellPhoneController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Phone Number");
    }
    else if(priceMinController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Minimum Price");
    }
    else if(priceMaxController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Maximum Price");
    }
    else{Navigator.push(context, MaterialPageRoute(builder: (context) => const AddHouseListingScreen()));
    }
  }

}
