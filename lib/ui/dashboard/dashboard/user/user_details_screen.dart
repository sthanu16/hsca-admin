import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsca/common/custom_widget/toast_service.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/user_detail_bloc.dart';
import 'package:hsca/ui/dashboard/house/bloc/sent_report_bloc.dart';
import '../../../../common/bloc/navigation_bloc.dart';
import '../../../../common/constant/color_constants.dart';
import '../../../../common/constant/common_funcations.dart';
import '../../../../common/constant/image.dart';
import '../../../../common/constant/loader_dialog.dart';
import '../../../../common/constant/sizes.dart';
import '../../../../common/constant/string.dart';
import '../../../../common/constant/text_style_common.dart';
import '../../../../common/custom_widget/common_row.dart';
import '../../../../common/custom_widget/custom_button.dart';
import '../../../../common/custom_widget/custom_textfield.dart';
import '../../../../common/locator/locator.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(body: BlocBuilder<UserDetailBloc, UserDetailState>(
      builder: (context, listState) {
        if (listState is UserDetailLoadingState) {
          return viewLoader();
        } else if (listState is UserDetailSuccessState) {
          return SingleChildScrollView(
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
                              "${listState.userDetailModel?.data?.first_name ?? ""} ${listState.userDetailModel?.data?.last_name ?? ""}",
                              style: AppTextStyle.styleHeading20blw500),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 5),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorConstants.greenColor),
                            child: InkWell(
                              onTap: () {
                                BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(1, ''));
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageControl.arrowLeft,
                                    scale: 4,
                                  ),
                                  addWidth(2),
                                  Text("Back",
                                      style: AppTextStyle.btnTxt15Grayw500
                                          .copyWith(
                                              color: ColorConstants.whiteColor)),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Card(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: ColorConstants.themeColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30.0),
                                        child: Text("User Details",
                                            style: AppTextStyle
                                                .styleTxt16Whitekw500),
                                      ),
                                    ],
                                  ),
                                ),
                                addHeight(15),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                      "Realtor Registration Id:",
                                      (listState.userDetailModel?.data
                                                      ?.realtor_id ??
                                                  "")
                                              .toString()
                                              .isEmpty
                                          ? ''
                                          : (listState.userDetailModel?.data
                                                  ?.realtor_id is String && (listState.userDetailModel?.data?.realtor_id ?? "").toString().isNotEmpty)
                                              ? "#${listState.userDetailModel?.data?.realtor_id}"
                                              : "",
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Realtor Name:",
                                        listState.userDetailModel?.data
                                                ?.realtor_first_name ??
                                            "")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Full Name:",
                                      "${listState.userDetailModel?.data?.first_name ?? ""} ${listState.userDetailModel?.data?.last_name ?? ""}",)),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Age:",
                                        listState.userDetailModel?.data?.age ??
                                            "")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Email id :",
                                        listState
                                                .userDetailModel?.data?.email ??
                                            "")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Street Address 1 :",
                                        listState.userDetailModel?.data
                                                ?.street_address ??
                                            "")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Street Address 2 :",
                                        listState.userDetailModel?.data
                                                ?.street_address2 ??
                                            "")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "City:",
                                        listState.userDetailModel?.data?.city ??
                                            "")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Postal/Zip Code:",
                                        listState.userDetailModel?.data
                                                ?.zipcode ??
                                            "")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Province/State:",
                                        listState
                                                .userDetailModel?.data?.state ??
                                            "")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Country:",
                                        listState.userDetailModel?.data
                                                ?.country ??
                                            "")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Cell Phone:",
                                        listState.userDetailModel?.data
                                                ?.cell_phone ??
                                            "")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Home Phone:",
                                        listState.userDetailModel?.data
                                                ?.home_phone ??
                                            "")),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 20, top: 10),
                                    child: commonRow(
                                        "Building Type:",
                                        listState.userDetailModel?.data
                                                ?.building_type ??
                                            "")),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 20, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text("Budget:",
                                              style: AppTextStyle
                                                  .detailStyle16blw500),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 170,
                                            decoration: const BoxDecoration(
                                              color:
                                                  ColorConstants.greyLightColor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                  "Min: \$${listState.userDetailModel?.data?.min_price ?? ""}",
                                                  style: AppTextStyle
                                                      .detailStyle16blw500
                                                      .copyWith(
                                                          fontSize: 14,
                                                          color: ColorConstants
                                                              .brownColor)),
                                            ),
                                          ),
                                          addWidth(6),
                                          Container(
                                            height: 35,
                                            width: 170,
                                            decoration: const BoxDecoration(
                                              color:
                                                  ColorConstants.greyLightColor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                  "Max: \$${listState.userDetailModel?.data?.max_price ?? ""}",
                                                  style: AppTextStyle
                                                      .detailStyle16blw500
                                                      .copyWith(
                                                          fontSize: 13,
                                                          color: ColorConstants
                                                              .brownColor)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                addHeight(16),
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            (listState.userDetailModel?.data?.houseData
                                        ?.length)! >
                                    0
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Card(
                                      color: ColorConstants.whiteColor,
                                      shadowColor: ColorConstants.whiteColor,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Column(
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.cover,
                                            clipBehavior: Clip.hardEdge,
                                            child: DataTable(
                                              border: TableBorder.all(
                                                width: 0.0,
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              // clipBehavior: Clip.hardEdge,
                                              dataRowHeight: 70,
                                              columnSpacing: 200,
                                              headingRowHeight: 70,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(40),
                                                ),
                                              ),
                                              headingRowColor:
                                                  MaterialStateColor
                                                      .resolveWith((states) =>
                                                          ColorConstants
                                                              .themeColor),
                                              columns: [
                                                DataColumn(
                                                  label: Text('House Id',
                                                      style: AppTextStyle
                                                          .styleContainer20Blackw600
                                                          .copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                ),
                                                DataColumn(
                                                  label: Text('House List',
                                                      style: AppTextStyle
                                                          .styleContainer20Blackw600
                                                          .copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                ),
                                                DataColumn(
                                                  label: Text('Rating',
                                                      style: AppTextStyle
                                                          .styleContainer20Blackw600
                                                          .copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                ),
                                                // DataColumn(
                                                //   label: Text('Action',
                                                //       style: AppTextStyle
                                                //           .styleContainer20Blackw600
                                                //           .copyWith(
                                                //         fontSize: 14,
                                                //         fontWeight:
                                                //             FontWeight.w500,
                                                //       )),
                                                // ),
                                              ],
                                              rows: List.generate(
                                                listState.userDetailModel?.data
                                                        ?.houseData?.length ??
                                                    0,
                                                (houseIndex) => DataRow(cells: [
                                                  DataCell(Text(
                                                      '#${listState.userDetailModel?.data?.houseData![houseIndex].id}',
                                                      style: AppTextStyle
                                                          .styleContainer20Blackw600
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  ColorConstants
                                                                      .themeColor,
                                                              fontSize: 12))),
                                                  DataCell(Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Text(
                                                            "${listState.userDetailModel?.data?.houseData![houseIndex].address}",
                                                            style: AppTextStyle
                                                                .styleContainer20Blackw600
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: ColorConstants
                                                                        .themeColor,
                                                                    fontSize:
                                                                        14)),
                                                      ),
                                                      addHeight(3),
                                                      Text(
                                                          dateConverter(listState
                                                                  .userDetailModel
                                                                  ?.data
                                                                  ?.houseData![
                                                                      houseIndex]
                                                                  .created_at ??
                                                              ""),
                                                          style: AppTextStyle
                                                              .styleContainer20Blackw600
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: ColorConstants
                                                                      .blackDarkColor,
                                                                  fontSize:
                                                                      12)),
                                                    ],
                                                  )),
                                                  DataCell(Text(
                                                      "${(listState.userDetailModel?.data?.houseData![houseIndex].rating ?? 100).round()} %",
                                                      style: AppTextStyle
                                                          .styleContainer20Blackw600
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: ColorConstants
                                                                  .themeColor))),
                                                  // DataCell(InkWell(
                                                  //   onTap: () {
                                                  //     BlocProvider.of<
                                                  //                 HouseDetailBloc>(
                                                  //             context)
                                                  //         .add(HouseDetailRefreshEvent(
                                                  //             houseId: listState
                                                  //                 .userDetailModel
                                                  //                 ?.data
                                                  //                 ?.houseData![
                                                  //                     houseIndex]
                                                  //                 .house_id));
                                                  //     BlocProvider.of<
                                                  //                 BottomNavigationSelectionBloc>(
                                                  //             context)
                                                  //         .add(
                                                  //             BottomNavigationSelectionRefreshEvent(
                                                  //                 7, ''));
                                                  //   },
                                                  //   child: Text("View",
                                                  //       style: AppTextStyle
                                                  //           .styleContainer20Blackw600
                                                  //           .copyWith(
                                                  //               fontWeight:
                                                  //                   FontWeight
                                                  //                       .w500,
                                                  //               color: ColorConstants
                                                  //                   .greenColor)),
                                                  // )),
                                                  // DataCell(
                                                  //   BlocListener<
                                                  //       DeleteHouseListBloc,
                                                  //       DeleteHouseListState>(
                                                  //     listener:
                                                  //         (context, dltState) {
                                                  //       if (dltState
                                                  //           is DeleteHouseListLoadingState) {
                                                  //       } else if (dltState
                                                  //           is DeleteHouseListSuccessState) {
                                                  //         if (dltState.index ==
                                                  //             houseIndex) {
                                                  //           BlocProvider.of<
                                                  //                       UserDetailBloc>(
                                                  //                   context)
                                                  //               .add(UserDetailRefreshEvent((listState
                                                  //                           .userDetailModel
                                                  //                           ?.data
                                                  //                           ?.id ??
                                                  //                       0)
                                                  //                   .toString()));
                                                  //           locator<ToastService>().showInCenter(
                                                  //               dltState
                                                  //                       .DeleteHouseModel
                                                  //                       ?.message ??
                                                  //                   "");
                                                  //         }
                                                  //       } else if (dltState
                                                  //           is DeleteHouseListErrorState) {
                                                  //         locator<ToastService>().showInCenter(
                                                  //                 dltState
                                                  //                     .error);
                                                  //       }
                                                  //     },
                                                  //     child: InkWell(
                                                  //       onTap: () {
                                                  //         BlocProvider.of<
                                                  //                     DeleteHouseListBloc>(
                                                  //                 context)
                                                  //             .add(DeleteHouseListRefreshEvent(
                                                  //                 houseId: (listState
                                                  //                             .userDetailModel
                                                  //                             ?.data
                                                  //                             ?.houseData![
                                                  //                                 houseIndex]
                                                  //                             .house_id ??
                                                  //                         0)
                                                  //                     .toString(),
                                                  //                 index:
                                                  //                     houseIndex));
                                                  //       },
                                                  //       child: Text("Delete",
                                                  //           style: AppTextStyle
                                                  //               .styleContainer20Blackw600
                                                  //               .copyWith(
                                                  //                   fontWeight:
                                                  //                       FontWeight
                                                  //                           .w500,
                                                  //                   color: ColorConstants
                                                  //                       .redColor,
                                                  //                   fontSize:
                                                  //                       14)),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                            /*(listState.userDetailModel?.data?.houseData
                                        ?.length)! >
                                    0
                                ? addHeight(20)
                                : Container(),
                            SizedBox(
                              width: width * 0.37,
                              child: Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.0),
                                          topRight: Radius.circular(15.0),
                                        ),
                                        color: ColorConstants.themeColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Text("Send report on Email",
                                                style: AppTextStyle
                                                    .btnTxt15Grayw500
                                                    .copyWith(
                                                        color: ColorConstants
                                                            .whiteColor)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    addHeight(15),
                                    Center(
                                      child: SizedBox(
                                        width: width * 0.27,
                                        child: CustomTextField(
                                          maxLines: 1,
                                          colors: ColorConstants.themeColor,
                                          controller: emailController,
                                          labelText: 'xyz@gmail.com',
                                          fillColor:
                                              ColorConstants.greyLightColor,
                                          color: ColorConstants.grey,
                                        ),
                                      ),
                                    ),
                                    addHeight(20),
                                    BlocListener<SentReportBloc,
                                        SentReportState>(
                                      listener: (context, sendState) {
                                        if (sendState
                                            is SentReportLoadingState) {
                                           locator<DialogService>()
                                              .showLoader();
                                        } else if (sendState
                                            is SentReportSuccessState) {
                                          locator<DialogService>().hideLoader();
                                          emailController.clear();
                                          locator<ToastService>().showInCenter(
                                              sendState.sentReportModel
                                                      ?.message ??
                                                  "");
                                        } else if (sendState
                                            is SentReportErrorState) {
                                          locator<DialogService>().hideLoader();
                                          locator<ToastService>()
                                              .showInCenter(sendState.error);
                                        }
                                      },
                                      child: SizedBox(
                                        width: width * 0.15,
                                        child: CustomButton(
                                          textColor: ColorConstants.whiteColor,
                                          onTap: () {
                                            if (emailController
                                                .text.isNotEmpty) {
                                              BlocProvider.of<SentReportBloc>(
                                                      context)
                                                  .add(SentReportRefreshEvent(
                                                      (listState.userDetailModel
                                                                  ?.data?.id ??
                                                              0)
                                                          .toString(),
                                                      emailController.text
                                                          .trim()));
                                            } else {
                                              locator<ToastService>()
                                                  .showInCenter(
                                                      'Please enter email');
                                            }
                                          },
                                          text: StringControl.send,
                                          textSize: 14.sp,
                                          buttonColor:
                                              ColorConstants.greenColor,
                                        ),
                                      ),
                                    ),
                                    addHeight(20),
                                  ],
                                ),
                              ),
                            ),*/
                          ],
                        )),
                  ],
                )
              ],
            ),
          );
        } else if (listState is UserDetailErrorState) {
          return Center(child: Text(listState.error));
        }
        return Container();
      },
    ));
  }
}
