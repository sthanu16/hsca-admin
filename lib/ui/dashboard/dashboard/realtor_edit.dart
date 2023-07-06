import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hsca/bloc/get_realtor_bloc.dart';
import 'package:hsca/common/constant/image.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/update_realtor_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/model/update_realtor_model.dart';

import '../../../common/bloc/navigation_bloc.dart';
import '../../../common/constant/color_constants.dart';
import '../../../common/constant/common_funcations.dart';
import '../../../common/constant/loader_dialog.dart';
import '../../../common/constant/sizes.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';

import '../../../common/custom_widget/custom_button.dart';
import '../../../common/custom_widget/custom_textfield.dart';
import '../../../common/custom_widget/navigation_service.dart';
import '../../../common/custom_widget/toast_service.dart';
import '../../../common/locator/locator.dart';

class EditRealtorScreen extends StatefulWidget {
  const EditRealtorScreen({Key? key}) : super(key: key);

  @override
  State<EditRealtorScreen> createState() => _EditRealtorScreenState();
}

class _EditRealtorScreenState extends State<EditRealtorScreen> {
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
  UpdateRealtorModel?  updateRequestModel;
  String? relatorId;

  List<String> listCanadaState = ["Alberta", "British Columbia","Manitoba", "New Brunswick", "Newfoundland and Labrador","Northwest Territories", "Nova Scotia","Nunavut", "Ontario", "Prince Edward Island", "Quebec", "Saskatchewan","Yukon"];
  List<String> listUnitedState = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"];
  List<String> listCountry = ["Canada", "United States",];

  String? stateName = "";
  String? countyName ='';
  bool? isLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocBuilder<RealtorListBloc,RealtorListState>(
      builder: (context,state){
      if(state is GetRealtorListState){
        if(isLoaded == false){
          firstNameController.text=state.getRetailerModel.first_name??"";
          lastNameController.text=state.getRetailerModel.last_name??"";
          emailController.text=state.getRetailerModel.email??"";
          streetAddressController1.text=state.getRetailerModel.street_address??"";
          streetAddressController2.text=state.getRetailerModel.street_address2??"";
          cityController.text=state.getRetailerModel.city??"";
          stateController.text=state.getRetailerModel.state??"";
          pinCodeController.text=state.getRetailerModel.zipcode??"";
          phoneController.text=state.getRetailerModel.phone??"";
          countryController.text=state.getRetailerModel.country??"";
          relatorId = (state.getRetailerModel.realtor_id is String)  ? "${state.getRetailerModel.realtor_id }" : "";
          countyName = state.getRetailerModel.country ?? '';
          stateName = state.getRetailerModel.state ?? '';
          debugPrint("countryIs:${state.getRetailerModel.country}");
          debugPrint("cityIs:${state.getRetailerModel.city}");
          isLoaded = true;
        }

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
                                  "Realtor",
                                  style: AppTextStyle.styleHeading20blw500
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 3),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
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
                                  StringControl.editRealtor,
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
                                  Row(
                                    children: [
                                      addWidth(10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                                        child: Text(StringControl.realtorId,style: AppTextStyle.styleTxt16pinkw500.copyWith(color: ColorConstants.themeColor)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: ColorConstants.greenColor
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15  ),
                                        child: Text("#$relatorId",
                                            style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 20)),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(25.0),
                                          child: Column(
                                            children: [
                                              CustomTextField(
                                                maxLines: 1,
                                                validation: (val){
                                                  if ((val?.isEmpty??false)) {
                                                    return 'Please Enter FirstName';
                                                  }else{
                                                    return null;
                                                  }
                                                },
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
                                                controller: cityController,
                                                labelText: StringControl.enterCity,
                                                headingText: StringControl.city,
                                                fillColor: ColorConstants.greyLightColor,
                                                color: ColorConstants.grey,
                                              ),
                                              // CustomTextField(
                                              //   maxLines: 1,
                                              //   validation: (val){
                                              //     if ((val?.isEmpty??false)) {
                                              //       return 'Please Enter State';
                                              //     }else{
                                              //       return null;
                                              //     }
                                              //   },
                                              //   colors: ColorConstants.grey,
                                              //   controller: stateController,
                                              //   labelText: StringControl.enterState,
                                              //   headingText: StringControl.state,
                                              //   fillColor: ColorConstants.greyLightColor,
                                              //   color: ColorConstants.grey,
                                              // ),
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
                                                            Text(stateName != '' ? stateName ??  StringControl.state : StringControl.state,
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
                                                            stateName = val;
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
                                              addHeight(40)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(25.0),
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
                                                labelText: StringControl.enterLastName,
                                                headingText: StringControl.lastName,
                                                fillColor: ColorConstants.greyLightColor,
                                                color: ColorConstants.grey,
                                              ),
                                              CustomTextField(
                                                maxLines: 1,
                                                validation: (val){
                                                  if ((val?.isEmpty??false)) {
                                                    return 'Please Enter Phone';
                                                  }else{
                                                    return null;
                                                  }
                                                },
                                                maxLength: 12,
                                                colors: ColorConstants.grey,
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
                                                maxLines: 1,
                                                validation: (val){
                                                  if ((val?.isEmpty??false)) {
                                                    return 'Please Enter ZipCode';
                                                  }else{
                                                    return null;
                                                  }
                                                },
                                                colors: ColorConstants.grey,
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
                                                        stateName = '';
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
                                              //   controller: countryController,
                                              //   labelText: StringControl.enterCountry,
                                              //   headingText: StringControl.country,
                                              //   fillColor: ColorConstants.greyLightColor,
                                              //   color: ColorConstants.grey,
                                              // ),
                                              addHeight(40)
                                            ],
                                          ),
                                        ),)
                                    ],
                                  ),

                                  BlocListener<UpdateRealtorBloc,UpdateRealtorState>(
                                    listener: (context, state) async{
                                      if(state is UpdateRealtorLoadingState){
                                        locator<DialogService>().showLoader();
                                      }else if (state is UpdateRealtorSuccessState){
                                        locator<DialogService>().hideLoader();
                                        locator<ToastService>().showInCenter(
                                         "Update successfully!",
                                        );
                                        BlocProvider.of<RealtorListBloc>(context).add(RealtorListRefreshEvent(
                                           page:  '1',
                                           keyword:  ''
                                        ));
                                        BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(3, ''));
                                      }
                                      else if(state is UpdateRealtorErrorState){
                                        locator<DialogService>().hideLoader();
                                        locator<ToastService>().showInCenter(
                                         state.error,
                                        );
                                      }
                                    },
                                    child: Center(
                                      child: SizedBox(
                                        width: width*0.2,
                                        child: CustomButton(
                                          textColor: ColorConstants.whiteColor,
                                          onTap: (){
                                            if(formKey.currentState?.validate()??false){
                                              UpdateRealtorModel updateRequestModel = UpdateRealtorModel(
                                                zipcode: pinCodeController.text.trim(),
                                                phone: phoneController.text.trim(),
                                                country: countryController.text.trim(),
                                                email: emailController.text.trim(),
                                                city: cityController.text.trim(),
                                                state: stateController.text.trim(),
                                                realtorId: relatorId,
                                                lastName: lastNameController.text.trim(),
                                                firstName: firstNameController.text.trim(),
                                                streetAddress2: streetAddressController2.text.trim(),
                                                streetAddress: streetAddressController1.text.trim(),
                                              );
                                              BlocProvider.of<UpdateRealtorBloc>(context)
                                                  .add(UpdateRealtorRefreshEvent(updateRealtorModel: updateRequestModel));

                                            }
                                            },
                                          //   onCall(context),
                                          text: StringControl.submit,
                                          textSize: 20.sp,
                                          buttonColor: ColorConstants.greenColor,
                                        ),
                                      ),
                                    ),
                                  ),

                                  addHeight(20)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
      }
      return Container();
    });
  }
}
