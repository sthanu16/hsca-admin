import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsca/common/constant/color_constants.dart';
import 'package:hsca/common/constant/sizes.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/dashboard_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/delete_user_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/user_detail_bloc.dart';

import '../../../common/bloc/navigation_bloc.dart';
import '../../../common/constant/common_funcations.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/loader_dialog.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/navigation_service.dart';
import '../../../common/custom_widget/toast_service.dart';
import '../../../common/locator/locator.dart';

class AnalyticScreen extends StatelessWidget {
   const AnalyticScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

     return BlocBuilder<DashboardBloc,DashboardState>(
       builder: (context,userState){
         if(userState is DashboardLoadingState){
           return viewLoader();
         }
         else if(userState is DashboardSuccessState){
           return Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               addHeight(15),
               Padding(
                 padding: const EdgeInsets.symmetric( horizontal: 20),
                 child: Text(
                    StringControl.tabDashboard,
                     style: AppTextStyle.styleHeading20blw500
                 ),
               ),
               addHeight(6),

               Padding(
                 padding: const EdgeInsets.symmetric( horizontal: 20),
                 child: Text(
                     StringControl.welcomeDashboard,
                     style: AppTextStyle.styleAppBar16w600.copyWith(color: ColorConstants.blackLightColor,fontSize: 14)

                 ),
               ),
               const SizedBox(
                 height: 20,
               ),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 12.0),
                 child: SizedBox(
                     width: double.infinity,
                     height: 140,
                     child: Row(
                       children: [
                         Expanded(
                           flex: 1,
                           child: SizedBox(
                             width: double.infinity,
                             child: Card(
                               elevation: 0.3,
                               shape: RoundedRectangleBorder(
                                 // side: BorderSide(color: Colors.white70, width: 1),
                                 borderRadius: BorderRadius.circular(10),
                               ),
                               child: ClipRRect(
                                 child: Container(
                                   decoration: const BoxDecoration(
                                     borderRadius: BorderRadius.only(
                                         topRight: Radius.circular(20),
                                         bottomRight: Radius.circular(20)),
                                   ),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       SizedBox(
                                         height: 70,
                                         width: 70,
                                         child: CircleAvatar(
                                             backgroundColor: ColorConstants.greyLightColor,
                                             child: SizedBox(
                                                 width: 70,
                                                 height: 70,
                                                 child: Center(
                                                     child: Image.asset(ImageControl.house,scale: 4,)
                                                 ))),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(left:20),
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text((userState.dashboardModel?.totalHouse??0).toString(),style: AppTextStyle.styleHeading12blw700.copyWith(fontSize: 22)),
                                             Text(StringControl.totalHouses,style: AppTextStyle.styleHeading12blw700.copyWith(color: ColorConstants.blackDarkColor,fontSize: 13,fontWeight: FontWeight.w100,

                                             )
                                             ),
                                           ],
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ),
                         const SizedBox(width: 10,),
                         Expanded(
                           flex: 1,
                           child: SizedBox(
                             width: double.infinity,
                             child: Card(
                               elevation: 0.3,
                               shape: RoundedRectangleBorder(
                                 // side: BorderSide(color: Colors.white70, width: 1),
                                 borderRadius: BorderRadius.circular(10),
                               ),
                               child: ClipRRect(
                                 child: Container(
                                   decoration: const BoxDecoration(
                                     borderRadius: BorderRadius.only(
                                         topRight: Radius.circular(20),
                                         bottomRight: Radius.circular(20)),
                                   ),
                                   child: Padding(
                                     padding: const EdgeInsets.all(15),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         SizedBox(
                                           height: 70,
                                           width: 70,
                                           child: CircleAvatar(
                                               backgroundColor: ColorConstants.greyLightColor,
                                               child: SizedBox(
                                                   width: 70,
                                                   height: 70,
                                                   child: Center(
                                                       child: Image.asset(ImageControl.totalUser,scale: 4,)
                                                   ))),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left:20),
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text((userState.dashboardModel?.userRows?.totalUsers??0).toString(),style: AppTextStyle.styleHeading12blw700.copyWith(fontSize: 22)),
                                               Text(StringControl.totalUsers,style: AppTextStyle.styleHeading12blw700.copyWith(color: ColorConstants.blackDarkColor,fontSize: 13,fontWeight: FontWeight.w100,

                                               )
                                               ),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ),
                         const SizedBox(width: 10,),
                         // Expanded(
                         //   flex: 1,
                         //   child: SizedBox(
                         //     width: double.infinity,
                         //     child: Card(
                         //       elevation: 0.3,
                         //       shape: RoundedRectangleBorder(
                         //         // side: BorderSide(color: Colors.white70, width: 1),
                         //         borderRadius: BorderRadius.circular(10),
                         //       ),
                         //       child: ClipRRect(
                         //         child: Container(
                         //           decoration: const BoxDecoration(
                         //             borderRadius: BorderRadius.only(
                         //                 topRight: Radius.circular(20),
                         //                 bottomRight: Radius.circular(20)),
                         //           ),
                         //           child: Padding(
                         //             padding: const EdgeInsets.all(15),
                         //             child: Row(
                         //               mainAxisAlignment: MainAxisAlignment.center,
                         //               crossAxisAlignment: CrossAxisAlignment.center,
                         //               children: [
                         //                 SizedBox(
                         //                   height: 70,
                         //                   width: 70,
                         //                   child: CircleAvatar(
                         //                       backgroundColor: ColorConstants.greyLightColor,
                         //                       child: SizedBox(
                         //                           width: 70,
                         //                           height: 70,
                         //                           child: Center(
                         //                               child: Image.asset(ImageControl.dollor,scale: 4,)
                         //                           ))),
                         //                 ),
                         //                 Padding(
                         //                   padding: const EdgeInsets.only(left:20),
                         //                   child: Column(
                         //                     mainAxisAlignment: MainAxisAlignment.center,
                         //                     crossAxisAlignment: CrossAxisAlignment.start,
                         //                     children: [
                         //                       Text("\$${((userState.dashboardModel?.userRows?.maxPriceAvg??0)-(userState.dashboardModel?.userRows?.minPriceAvg??0)).round()}",style:AppTextStyle.styleHeading12blw700.copyWith(fontSize: 22)),
                         //                       Text(StringControl.averageBudget,style: AppTextStyle.styleHeading12blw700.copyWith(color: ColorConstants.blackDarkColor,fontSize: 13,fontWeight: FontWeight.w100,
                         //
                         //                       )
                         //                       ),
                         //                     ],
                         //                   ),
                         //                 ),
                         //               ],
                         //             ),
                         //           ),
                         //         ),
                         //       ),
                         //     ),
                         //   ),
                         // ),
                         // const SizedBox(width: 10,),
                         Expanded(
                           flex: 1,
                           child: SizedBox(
                             width: double.infinity,
                             child: Card(
                               elevation: 0.3,
                               shape: RoundedRectangleBorder(
                                 // side: BorderSide(color: Colors.white70, width: 1),
                                 borderRadius: BorderRadius.circular(10),
                               ),
                               child: ClipRRect(
                                 child: Container(
                                   decoration: const BoxDecoration(
                                     borderRadius: BorderRadius.only(
                                         topRight: Radius.circular(20),
                                         bottomRight: Radius.circular(20)),
                                   ),
                                   child: Padding(
                                     padding: const EdgeInsets.all(15),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         SizedBox(
                                           height: 70,
                                           width: 70,
                                           child: CircleAvatar(
                                               backgroundColor: ColorConstants.greyLightColor,
                                               child: SizedBox(
                                                   width: 70,
                                                   height: 70,
                                                   child: Center(
                                                       child:Image.asset(ImageControl.realtors,scale: 4,)
                                                   ))),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left:20),
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text((userState.dashboardModel?.totalRealtor??0).toString(),style: AppTextStyle.styleHeading12blw700.copyWith(fontSize: 22)),
                                               Text(StringControl.totalRealtors,style: AppTextStyle.styleHeading12blw700.copyWith(color: ColorConstants.blackDarkColor,fontSize: 13,fontWeight: FontWeight.w100,

                                               )
                                               ),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ],
                     )
                 ),
               ),
               const SizedBox(
                 height: 28,
               ),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text(StringControl.buyerList,
                     style: AppTextStyle.styleHeading20blw500

                     ),
                     InkWell(
                       onTap: (){
                         BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(1, ''));
                       },
                       child: Container(
                         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(30),
                             color: ColorConstants.greenColor
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text(StringControl.viewAll,style: AppTextStyle.styleTxtField16Grayw400.copyWith(fontSize: 12,color: ColorConstants.whiteColor),),
                             const Icon(Icons.arrow_right_outlined,color: Colors.white,)
                           ],
                         ),
                       ),
                     )
                   ],
                 ),
               ),
               addHeight(10),

               Expanded(
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 12.0),
                     child: Card(
                       color: ColorConstants.whiteColor,
                       shadowColor:  ColorConstants.whiteColor,
                       elevation: 3,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10.0)),
                       child: Column(
                         children: [
                           FittedBox(
                             fit: BoxFit.cover,
                             clipBehavior: Clip.hardEdge,
                             child: DataTable(
                               border: TableBorder.all(
                                 width: 0.0,
                                 color: Colors.transparent,
                                 borderRadius: BorderRadius.circular(20),
                               ),
                               clipBehavior: Clip.hardEdge,
                               dataRowHeight: 70,
                               columnSpacing: 200,
                               headingRowHeight: 70,
                               decoration: const BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   topRight: Radius.circular(40),
                                 ),
                                ),
                               headingRowColor:
                               MaterialStateColor.resolveWith((states) => ColorConstants.themeColor),
                               columns: [
                                 DataColumn(
                                   label: Text('S No.',
                                       style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 14)
                                   ),
                                 ),
                                 DataColumn(
                                   label: Text('Realtor Reg. Id',
                                       style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 14)
                                   ),
                                 ),
                                 DataColumn(
                                   label: Text('User Name',
                                       style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 14)
                                   ),
                                 ),
                                 DataColumn(
                                   label: Text('Date & Time',
                                       style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 14)
                                   ),
                                 ),
                                 DataColumn(
                                   label: Text('House List',
                                       style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 14)
                                   ),
                                 ),

                                 DataColumn(
                                   label: Text('Action',
                                       style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 14)
                                   ),
                                 ),

                               ],
                               rows: List.generate(
                                 userState.dashboardModel?.data?.length??0,
                                 // controller.list.length,
                                     (index) => DataRow(cells: [
                                   DataCell(Text(
                                     '${((1 * 10) - 10) + index + 1}.',
                                       style: AppTextStyle.sr14Grayw600

                                   )),
                                   DataCell(Text(
                                       (userState.dashboardModel?.data?[index].realtor_id is String && (userState.dashboardModel?.data?[index].realtor_id ?? "").toString().isNotEmpty)  ? "#${userState.dashboardModel?.data?[index].realtor_id}" : "",
                                      style: AppTextStyle.sr14Grayw600

                                   )),
                                   DataCell(Text(
                                       "${userState.dashboardModel?.data![index].first_name} ${userState.dashboardModel?.data![index].last_name}",
                                       style: AppTextStyle.sr14Grayw600.copyWith(color: ColorConstants.blackLightColor)
                                   )),
                                   DataCell(Text(
                                       dateConverter(userState.dashboardModel?.data![index].created_at??""),
                                       style: AppTextStyle.sr14Grayw600.copyWith(
                                         color: ColorConstants.blackDarkColor
                                       )
                                   )),
                                   DataCell(
                                       Text((userState.dashboardModel?.data![index].totalHomes??0).toString(),
                                           style: AppTextStyle.sr14Grayw600.copyWith(
                                               color: ColorConstants.greenColor,fontSize: 24
                                           )
                                       ),
                                   ),
                                   DataCell(
                                     Row(
                                       children: [
                                         BlocListener<DeleteUserListBloc,DeleteUserListState>(
                                           listener: (context,dltState){
                                             if(dltState is DeleteUserListLoadingState){
                                             //  locator<DialogService>().showLoader();
                                             }
                                             else if(dltState is DeleteUserListSuccessState){
                                               if(dltState.index == index){
                                                 BlocProvider.of<DashboardBloc>(context).add(DashboardRefreshEvent());
                                                 locator<ToastService>().showInCenter( dltState.deleteUserModel?.message??"");
                                               }
                                             }
                                             else if(dltState is DeleteUserListErrorState){
                                               locator<ToastService>().showInCenter( dltState.error);
                                             }
                                           },child:  InkWell(
                                           onTap: (){
                                             AwesomeDialog(
                                               width: 550,
                                               btnCancel: InkWell(
                                                 onTap: (){
                                                   locator<NavigationService>().pop();
                                                 },
                                                 child: Container(
                                                   height: 45,
                                                   width: 100,
                                                   decoration: BoxDecoration(
                                                     color: Colors.red,
                                                     borderRadius: BorderRadius.circular(20.r),
                                                   ),
                                                   child: Center(child: Text(StringControl.cancel,style: AppTextStyle.styleTxt16pinkw500.copyWith(color: ColorConstants.whiteColor),)),
                                                 ),
                                               ),
                                               btnOk: InkWell(
                                                 onTap: (){
                                                   locator<NavigationService>().pop();
                                                   BlocProvider.of<DeleteUserListBloc>(context).add(DeleteUserListRefreshEvent(userId:(userState.dashboardModel?.data![index].id??0).toString() ,index: index));
                                                 },
                                                 child: Container(
                                                   height: 45,
                                                   width: 100,
                                                   decoration: BoxDecoration(
                                                     color: Colors.green,
                                                     borderRadius: BorderRadius.circular(20.r),
                                                   ),
                                                   child: Center(child: Text(StringControl.ok,style: AppTextStyle.styleTxt16pinkw500.copyWith(color: ColorConstants.whiteColor),)),
                                                 ),
                                               ),
                                               context: context,
                                               dialogType: DialogType.warning,
                                               animType: AnimType.rightSlide,
                                               title: 'Delete',
                                               btnOkText: 'Delete',
                                               desc: 'Are you sure you want to delete User ?',
                                             ).show();

                                           },
                                           child: Text('Delete',
                                             style: AppTextStyle.sr14Grayw600.copyWith(
                                                 color: ColorConstants.redColor,fontWeight: FontWeight.w500
                                             ),
                                           ),
                                         ),),
                                         const SizedBox(width: 15,),
                                         InkWell(
                                           onTap: (){
                                             BlocProvider.of<UserDetailBloc>(context).add(UserDetailRefreshEvent((userState.dashboardModel?.data![index].id??0).toString()));
                                             BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(5,''));
                                           },
                                           child: Text('View >',
                                               style: AppTextStyle.sr14Grayw600.copyWith(
                                                   color: ColorConstants.greenColor,
                                               )),
                                         )
                                       ],
                                     ),
                                   )
                                 ]),
                               ),
                             ),
                           ),

                         ],
                       ),
                     ),
                   ),

                 ),
               )

             ],
           );
         }
         else if(userState is DashboardErrorState){
           return Center(child: Text(userState.error));
         }
         return Container();
       },
     );

   }
}