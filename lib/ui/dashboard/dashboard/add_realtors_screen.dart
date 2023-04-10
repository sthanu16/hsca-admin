import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hsca/common/custom_widget/toast_service.dart';
import 'package:hsca/ui/realtor/bloc/add_realtor_bloc.dart';

import '../../../bloc/get_realtor_bloc.dart';
import '../../../common/bloc/navigation_bloc.dart';
import '../../../common/constant/color_constants.dart';
import '../../../common/constant/common_funcations.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/loader_dialog.dart';
import '../../../common/constant/sizes.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/custom_textfield.dart';
import '../../../common/custom_widget/navigation_service.dart';
import '../../../common/custom_widget/validations.dart';
import '../../../common/locator/locator.dart';
import '../../../data/model/add_retailor_request_model.dart';

class AddRealtorsScreen extends StatefulWidget {
  const AddRealtorsScreen({Key? key}) : super(key: key);

  @override
  State<AddRealtorsScreen> createState() => _AddRealtorsScreenState();
}

class _AddRealtorsScreenState extends State<AddRealtorsScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController streetAddressController1 = TextEditingController();
  final TextEditingController streetAddressController2 = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController relatorIdController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> listCanadaState = ["Alberta", "British Columbia","Manitoba", "New Brunswick", "Newfoundland and Labrador", "Nova Scotia", "Ontario", "Prince Edward Island", "Quebec", "Saskatchewan"];
  List<String> listUnitedState = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"];
  List<String> listCountry = ["Canada", "United States",];

  String? state = "";
  String? countyName ='';

  @override
  void initState() {
    super.initState();
    relatorIdController.text =getAlphaNumericString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                            " Add Realtor",
                            style: AppTextStyle.styleHeading20blw500
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorConstants.greenColor
                          ),
                          child: InkWell(
                            onTap: (){
                              BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(3, ''));
                            },
                            child: Row(
                              children: [
                                Image.asset(ImageControl.arrowLeft,scale: 4,),
                                addWidth(2),
                                Text(
                                    "Back",
                                    style: AppTextStyle.styleAppBar16w600.copyWith(color: ColorConstants.whiteColor,fontSize: 14)                              ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              addHeight(20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 6),
                child: Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                            color: ColorConstants.themeColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10),
                          child: Text(
                            StringControl.addRealtor1,
                            style: AppTextStyle.styleContainer20Blackw600,
                          ),
                        ),
                      ),
                      addHeight(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addHeight(20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: CustomTextField(
                                onChanged: (val){
                                  setState(() {});
                                },
                                isMandatory: true,
                                maxLines: 1,
                                maxLength: 7,
                                colors: ColorConstants.grey,
                                controller: relatorIdController,
                                labelText: StringControl.realtorId,
                                headingText: StringControl.realtorId,
                                fillColor: ColorConstants.greyLightColor,
                                color: ColorConstants.grey,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Column(
                                      children: [
                                        CustomTextField(
                                          validation: (val){
                                            if ((val?.isEmpty??false)) {
                                              return 'Please Enter FirstName';
                                            }else{
                                              return null;
                                            }
                                          },
                                          maxLines: 1,
                                          isMandatory: true,
                                          colors: ColorConstants.grey,
                                          controller: firstNameController,
                                          labelText: StringControl.enterFirstName,
                                          headingText: StringControl.firstName,
                                          fillColor: ColorConstants.greyLightColor,
                                          color: ColorConstants.grey,
                                        ),
                                        CustomTextField(
                                          maxLines: 1,
                                          validation: (val){
                                            if ((val?.isEmpty??false)) {
                                              return 'Please Enter Email';
                                            }else if (!EmailValidator.validate(emailController.text)) {
                                              return 'Please Enter Valid Email';
                                            }else{
                                              return null;
                                            }
                                          },
                                          colors: ColorConstants.grey,
                                          controller: emailController,
                                          isMandatory: true,
                                          labelText: StringControl.enterEmail,
                                          headingText: StringControl.email,
                                          fillColor: ColorConstants.greyLightColor,
                                          color: ColorConstants.grey,
                                        ),
                                        CustomTextField(
                                          maxLines: 1,
                                          validation: (val){
                                            if ((val?.isEmpty??false)) {
                                              return 'Please Enter Address';
                                            }else{
                                              return null;
                                            }
                                          },
                                          colors: ColorConstants.grey,
                                          isMandatory: true,
                                          controller: streetAddressController1,
                                          labelText: StringControl.enterStreetAddress1,
                                          headingText: StringControl.streetAddress1,
                                          fillColor: ColorConstants.greyLightColor,
                                          color: ColorConstants.grey,
                                        ),
                                        CustomTextField(
                                          maxLines: 1,
                                          validation: (val){
                                            if ((val?.isEmpty??false)) {
                                              return 'Please Enter City';
                                            }else{
                                              return null;
                                            }
                                          },
                                          colors: ColorConstants.grey,
                                          isMandatory: true,
                                          controller: cityController,
                                          labelText: StringControl.enterCity,
                                          headingText: StringControl.city,
                                          fillColor: ColorConstants.greyLightColor,
                                          color: ColorConstants.grey,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(width: 15,),
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(StringControl.state + '*',
                                                    style: AppTextStyle.styleContainer14Grayw600.copyWith(color: ColorConstants.themeColor,fontSize: 17)
                                                )
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h,),
                                        InkWell(
                                          onTap: (){
                                            if(countyName==''){
                                              locator<ToastService>().showInCenter("Please select country first");
                                            }
                                          },
                                          child: Container(
                                            height: 40.h,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.r),
                                                border: Border.all(color: ColorConstants.greyLightColor),
                                                color: ColorConstants.greyLightColor
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                                              child: IgnorePointer(
                                                ignoring:countyName!=''?false: true,
                                                child: DropdownButton<dynamic>(
                                                  icon: Image.asset(ImageControl.arrowOn, scale: 4,
                                                    color:Colors.black87,),
                                                  hint: Row(
                                                    children: [
                                                      Text(state != '' ? state ??  StringControl.state : StringControl.state,
                                                        style: TextStyle(
                                                          color:  ColorConstants.grey,
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight.w500,
                                                        )
                                                      ),
                                                    ],
                                                  ),
                                                  items: countyName == 'Canada' ? listCanadaState.map((value) {
                                                    return DropdownMenuItem<dynamic>(
                                                      onTap: () {
                                                        stateController.text = value;
                                                      },
                                                      value: value,
                                                      child: Row(
                                                        children: [
                                                          Text(value,
                                                            style: AppTextStyle.styleHeading24blw700
                                                                .copyWith(
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14,
                                                                color: ColorConstants.blackColor
                                                            ),),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList() : listUnitedState.map((value) {
                                                    return DropdownMenuItem<dynamic>(
                                                      onTap: () {
                                                        stateController.text = value;
                                                      },
                                                      value: value,
                                                      child: Row(
                                                        children: [
                                                          Text(value,
                                                            style: AppTextStyle.styleHeading24blw700
                                                                .copyWith(
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 14,
                                                                color: ColorConstants.blackColor
                                                            ),),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (val) {
                                                    setState(() {
                                                      state = val;
                                                    },
                                                    );
                                                  },
                                                  isExpanded: true,
                                                  underline: const SizedBox(),
                                                ),
                                              ),
                                            ),

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Column(
                                      children: [
                                        CustomTextField(
                                          maxLines: 1,
                                          validation: (val){
                                            if ((val?.isEmpty??false)) {
                                              return 'Please Enter LastName';
                                            }else{
                                              return null;
                                            }
                                          },
                                          colors: ColorConstants.grey,
                                          controller: lastNameController,
                                          isMandatory: true,
                                          labelText: StringControl.enterLastName,
                                          headingText: StringControl.lastName,
                                          fillColor: ColorConstants.greyLightColor,
                                          color: ColorConstants.grey,
                                        ),
                                        CustomTextField(
                                          keyboardType: TextInputType.phone,
                                          validation: (val){
                                            if ((val?.isEmpty??false)) {
                                              return 'Please Enter Phone';
                                            }else{
                                              return null;
                                            }
                                          },
                                          maxLines: 1,
                                          maxLength: 12,
                                          colors: ColorConstants.grey,
                                          isMandatory: true,
                                          controller: phoneController,
                                          labelText: StringControl.enterPhoneNumber,
                                          headingText: StringControl.phoneNumber,
                                          fillColor: ColorConstants.greyLightColor,
                                          color: ColorConstants.grey,
                                        ),
                                        CustomTextField(
                                          maxLines: 1,
                                          colors: ColorConstants.grey,
                                          controller: streetAddressController2,
                                          labelText: StringControl.enterStreetAddress2,
                                          headingText: StringControl.streetAddress2,
                                          fillColor: ColorConstants.greyLightColor,
                                          color: ColorConstants.grey,
                                        ),
                                        CustomTextField(
                                          keyboardType: TextInputType.phone,
                                          maxLines: 1,
                                          validation: (val){
                                            if ((val?.isEmpty??false)) {
                                              return 'Please Enter ZipCode';
                                            }else{
                                              return null;
                                            }
                                          },
                                          colors: ColorConstants.grey,
                                          isMandatory: true,
                                          controller: pinCodeController,
                                          labelText: StringControl.enterPostal,
                                          headingText: StringControl.postal,
                                          fillColor: ColorConstants.greyLightColor,
                                          color: ColorConstants.grey,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(width: 15,),
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(StringControl.country + '*',
                                                    style: AppTextStyle.styleContainer14Grayw600.copyWith(color: ColorConstants.themeColor,fontSize: 17)
                                                )
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h,),
                                        Container(
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.r),
                                              border: Border.all(color: ColorConstants.greyLightColor),
                                              color: ColorConstants.greyLightColor
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                                            child: DropdownButton<dynamic>(
                                              icon: Image.asset(ImageControl.arrowOn, scale: 4,
                                                color: Colors.black87,),
                                              hint: Row(
                                                children: [
                                                  Text(countyName != '' ? countyName ??  StringControl.country : StringControl.country,
                                                      style: TextStyle(
                                                        color:  ColorConstants.grey,
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w500,
                                                      )
                                                  ),
                                                ],
                                              ),
                                              items: listCountry.map((value) {
                                                return DropdownMenuItem<dynamic>(
                                                  onTap: () {
                                                  },
                                                  value: value,
                                                  child: Row(
                                                    children: [
                                                      Text(value,
                                                        style: AppTextStyle.styleHeading24blw700
                                                            .copyWith(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 14,
                                                            color: ColorConstants.blackColor
                                                        ),),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (val) {
                                                countryController.text = val;
                                                setState(() {
                                                  countyName = val;
                                                  state = '';
                                                },
                                                );
                                              },
                                              isExpanded: true,
                                              underline: const SizedBox(),
                                            ),
                                          ),

                                        ),
                                        // CustomTextField(
                                        //   maxLines: 1,
                                        //   validation: (val){
                                        //     if ((val?.isEmpty??false)) {
                                        //       return 'Please Enter Country';
                                        //     }else{
                                        //       return null;
                                        //     }
                                        //   },
                                        //   colors: ColorConstants.grey,
                                        //   isMandatory: true,
                                        //   controller: countryController,
                                        //   labelText: StringControl.enterCountry,
                                        //   headingText: StringControl.country,
                                        //   fillColor: ColorConstants.greyLightColor,
                                        //   color: ColorConstants.grey,
                                        // ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),

                            addHeight(20),

                            BlocListener<AddRealtorBloc,AddRealtorState>(
                              listener: (context,state){
                                if(state is AddRealtorLoadingState){
                                  locator<DialogService>().showLoader();
                                }
                                else if(state is AddRealtorSuccessState){
                                  locator<DialogService>().hideLoader();
                                  BlocProvider.of<RealtorListBloc>(context).add(RealtorListRefreshEvent(
                                      page:  '1',
                                      keyword:  ''
                                  ));
                                  BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(3,''));
                                  locator<ToastService>().showInCenter(state.addRealtorModel?.message??"");
                           //       locator<NavigationService>().pop();
                                }
                                else if(state is AddRealtorErrorState){
                                  locator<DialogService>().hideLoader();
                                  locator<ToastService>().showInCenter(state.error);
                                }
                              },child:  Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      if(formKey.currentState?.validate()??false){
                                        AddRealtorRequestModel requestModel = AddRealtorRequestModel(
                                            email: emailController.text.trim(),
                                            address: streetAddressController1.text.trim(),
                                            age: '',
                                            building: '',
                                            city: cityController.text.trim(),
                                            firstName: firstNameController.text.trim(),
                                            fullAddress: streetAddressController2.text.trim(),
                                            lastName: lastNameController.text.trim(),
                                            mobile: phoneController.text.trim(),
                                            pinCode: pinCodeController.text.trim(),
                                            priceMax: '',
                                            priceMin: '',
                                            realtorId: relatorIdController.text.trim(),
                                            state: stateController.text.trim(),
                                            telephone:phoneController.text.trim(),
                                            country: countryController.text.trim()
                                        );
                                        BlocProvider.of<AddRealtorBloc>(context).add(AddRealtorRefreshEvent(requestModel));
                                      }

                                    },
                                    child: Container(
                                      height: 50,
                                      width: 230,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          color: ColorConstants.greenColor
                                      ),
                                      child: Center(child: Text(StringControl.submit,style: AppTextStyle.styleHeading24blw700.copyWith(color: ColorConstants.whiteColor,fontSize: 20),)),
                                    ),
                                  ),
                                ],
                              ),
                            ),),
                            addHeight(20)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
