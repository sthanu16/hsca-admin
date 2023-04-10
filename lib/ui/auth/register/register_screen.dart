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
import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield.dart';
import '../../../common/custom_widget/toast_service.dart';
import '../../../common/locator/locator.dart';
import '../../dashboard/home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
  var items = ['Detach', 'Semi', 'Row', 'Condo', 'others'];
  String? building = "";

  String countyName = "Country";
  String countyFlag = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorConstants.backgroundColor.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40.h,),
              Image.asset(
                ImageControl.logo,scale: 9,
              ),
              Text(StringControl.createAccount,style: AppTextStyle.styleHeading24blw700),
              SizedBox(height: 20.h),
              Text(StringControl.nostrud,style: AppTextStyle.Txt13pinkw600),
              SizedBox(height: 20.h),
              SizedBox(height: 20.h),
              CustomTextField(
                maxLines: 1,
                headingText: StringControl.realtorRegistrationNumber,
                controller: realtorNumberController,
                labelText: StringControl.realtorRegistrationNumber,
                fillColor: ColorConstants.greyLightColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.relater,height: 5,color: Colors.black,),
                ),
              ),
              SizedBox(height: 15.h),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.name,
                controller: firstNameController,
                labelText: StringControl.name,
                fillColor: ColorConstants.greyLightColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
                  child: Image.asset(ImageControl.user,height: 5,color: Colors.black,),
                ),

              ),
              SizedBox(height: 15.h),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.lastName,
                controller: lastNameController,
                labelText: StringControl.lastName,
                fillColor: ColorConstants.greyLightColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 12.h),
                  child: Image.asset(ImageControl.user,height: 5,color: Colors.black,),
                ),
              ),
              SizedBox(height: 15.h),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.age,
                controller: ageController,
                labelText: StringControl.age,
                fillColor: ColorConstants.greyLightColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 12.h),
                  child: Image.asset(ImageControl.user,height: 5,color: Colors.black,),
                ),
              ),
              SizedBox(height: 15.h,),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.email,
                controller: emailController,
                labelText: StringControl.email,
                fillColor: ColorConstants.greyLightColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.email,height: 5,color: Colors.black,),
                ),
              ),
              SizedBox(height: 15.h,),
              CustomTextField(
                maxLines: 1,
                headingText: StringControl.addressLine1,
                controller: addressController,
                labelText: StringControl.addressLine1,
                fillColor: ColorConstants.greyLightColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 14.h),
                  child: Image.asset(ImageControl.address,scale: 4,color: Colors.black,),
                ),

              ),
              SizedBox(height: 15.h,),

              CustomTextField(
                maxLines: 1,
                controller: addressController1,
                labelText: StringControl.addressLine2,
                fillColor: ColorConstants.greyLightColor,
                prefixIcon: Image.asset(ImageControl.location,scale: 4,),

              ),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      maxLines: 1,
                      // headingText: StringControl.city,
                      controller: cityController,
                      labelText: StringControl.city,
                      prefixIcon: Image.asset(ImageControl.building,scale: 4,),

                      fillColor: ColorConstants.greyLightColor,
                    ),
                  ),
                  SizedBox(width: 15.w,),
                  Expanded(
                    child: CustomTextField(
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
                ],
              ),
              SizedBox(height: 15.h,),

              CustomTextField(
                maxLines: 1,
                headingText: StringControl.state,
                controller: stateController,
                labelText: StringControl.state,
                fillColor: ColorConstants.greyLightColor,
                prefixIcon: Image.asset(ImageControl.earth,scale: 4,),

              ),
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
                            // color:ColorConstants.greyLightColor,
                            border: Border.all(),
                              borderRadius: BorderRadius.circular(10.r)),
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
                                child: const Icon(Icons.keyboard_arrow_down,color:Color.fromRGBO(0,0,0,0.5098039215686274 )),
                              )
                            ],
                          ),
                        ),
                      ),
              SizedBox(height: 15.h,),
              CustomTextField(

              //  focusColor: ColorConstants.greyLightColor,
                maxLines: 1,
                headingText: StringControl.homePhone,
                controller: homePhoneController,
                labelText:StringControl.homePhone,
                fillColor: ColorConstants.greyLightColor,
                keyboardType: TextInputType.number,
                prefixIcon: Image.asset(ImageControl.phone,scale: 4,),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
              ),
              SizedBox(height: 15.h,),
              CustomTextField(
                maxLines: 1,
                headingText: StringControl.cellPhone,
                controller: cellPhoneController,
                labelText: StringControl.cellPhone,
                keyboardType: TextInputType.number,
                prefixIcon: Image.asset(ImageControl.phone,scale: 4,),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
                fillColor: ColorConstants.greyLightColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 50.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: ColorConstants.navyBlueColor),
                  // color: ColorConstants.greyLightColor

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
                height: 30.h,
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

              SizedBox(
                height: 30.h,
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: CustomButton(
              textColor: ColorConstants.whiteColor,
              onTap: () =>  onCall(context),
               //   Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),)),
              text: StringControl.register,
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

  void onCall(context) {

    if(realtorNumberController.text.isEmpty ) {
      locator<ToastService>().showInCenter( "Please Enter Realtor Number",);
    }
   else if(firstNameController.text.isEmpty ) {
      locator<ToastService>().showInCenter( "Please Enter First Name",);
    }else if(lastNameController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Last Name",);
    }else if(ageController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Age",);
    } else if(emailController.text.isEmpty ) {
      locator<ToastService>().showInCenter( "Please Enter Email Address",);
    }else if(!EmailValidator.validate(emailController.text)) {
      locator<ToastService>().showInCenter( "Please Enter Valid Email Address",);
    }else if(addressController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Address",);
    }else if(addressController1.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Address",);
    }else if(cityController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter City",);
    }else if(stateController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter State",);
    }else if(pinCodeController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Pin Code",);
    }else if(homePhoneController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Phone Number",);
    }else if(items?.isEmpty??false){
      if(buildingController.text.isEmpty){
        locator<ToastService>().showInCenter(
         "Please Select Building Type");
      }else{print(buildingController.text);}
    }
   else if(cellPhoneController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Phone Number",);
    }else if(priceMinController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Minimum Price",);
    }else if(priceMaxController.text.isEmpty){
      locator<ToastService>().showInCenter( "Please Enter Maximum Price",);
    }
    else{Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(

    ),));
    }
  }
}
