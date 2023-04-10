import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsca/common/constant/color_constants.dart';
import 'package:hsca/common/constant/common_funcations.dart';
import 'package:hsca/common/constant/loader_dialog.dart';
import 'package:hsca/common/constant/sizes.dart';
import 'package:hsca/common/constant/text_style_common.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/delete_realtor_bloc.dart';

import '../../../bloc/get_realtor_bloc.dart';
import '../../../common/bloc/navigation_bloc.dart';
import '../../../common/constant/string.dart';
import '../../../common/custom_widget/navigation_service.dart';
import '../../../common/custom_widget/page_bar_view.dart';
import '../../../common/custom_widget/pagination_footer.dart';
import '../../../common/custom_widget/toast_service.dart';
import '../../../common/locator/locator.dart';
import '../../../data/model/get_retailer_model.dart';

class RealtorsScreen extends StatefulWidget {
  const RealtorsScreen({Key? key}) : super(key: key);

  @override
  State<RealtorsScreen> createState() => _RealtorsScreenState();
}

class _RealtorsScreenState extends State<RealtorsScreen> {
  Timer? _debounce;
  DataBean? saveRetailerModel;
  int page =1;
  String keyword ='';
  TextEditingController searchController = TextEditingController();


  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         PageBarView(
           heading: StringControl.realtors,
           title: StringControl.realtorsList,
           textController: searchController,
           hintText: "Search by Realtor Id or name",
           onChange: (String value) {
             keyword = value;
             if (_debounce?.isActive ?? false) _debounce?.cancel();
             _debounce =
                 Timer(const Duration(milliseconds: 500), () {
                   BlocProvider.of<RealtorListBloc>(context).add(RealtorListRefreshEvent(
                       page: page.toString(),
                       keyword:  keyword
                   ));
                 });
           },
         ),
         Align(
           alignment: Alignment.centerRight,
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12.0),
             child: Container(
               height: 45,
               width: 230,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.r),
                   color: ColorConstants.greenColor
               ),
               child: InkWell(
                   onTap: (){
                     BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(4, ''));
                   },
                   child: Center(child: Text(StringControl.addRealtor,style: AppTextStyle.styleTxt16pinkw500.copyWith(color: ColorConstants.whiteColor),))),
             ),
           ),
         ),

         addHeight(20),

         BlocBuilder<RealtorListBloc,RealtorListState>(
           builder: (context,listState){
             if(listState is RealtorListLoadingState){
               return locator<DialogService>().shimmerEffectUIWidget(context);
             }
             else if(listState is RealtorListSuccessState){
               return  Expanded(
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 12.0),
                     child: Card(
                       color: ColorConstants.whiteColor,
                       shadowColor:  ColorConstants.whiteColor,
                       elevation: 0.0,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10.0)),
                       child: Column(
                         children: [
                           FittedBox(
                             fit: BoxFit.cover,
                             child: DataTable(
                               columnSpacing: 200,
                               dataRowHeight: 70,
                               headingRowHeight: 70,
                               border: TableBorder.all(
                                 width: 0.0,
                                 color: Colors.transparent,
                                 borderRadius: BorderRadius.circular(20),
                               ),
                               clipBehavior: Clip.hardEdge,
                               headingRowColor:
                               MaterialStateColor.resolveWith((states) => ColorConstants.themeColor),
                               columns: [
                                 DataColumn(
                                   label: Text('S No.',
                                       style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 14)
                                   ),
                                 ),
                                 DataColumn(
                                   label: Text('Realtor Id',
                                       style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 14)
                                   ),
                                 ),
                                 DataColumn(
                                   label: Text('Full Name',
                                       style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 14)
                                   ),
                                 ),
                                 DataColumn(
                                   label: Text('Date & Time',
                                       style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 14)
                                   ),
                                 ),
                                 DataColumn(
                                   label: Text('Buyer Count',
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
                                 listState.getRetailerModel?.data?.length??0,
                                     (index) => DataRow(cells: [
                                   DataCell(Text(
                                     '${((page * 10) - 10) + index + 1}.',
                                   )),
                                   DataCell(Text(
                                       (listState.getRetailerModel?.data?[index].realtor_id is String && (listState.getRetailerModel?.data?[index].realtor_id ?? "").toString().isNotEmpty)  ? "#${listState.getRetailerModel?.data?[index].realtor_id}" : "",
                                       style: AppTextStyle.btnTxt15Grayw500.copyWith(fontWeight: FontWeight.w500,color: ColorConstants.themeColor
                                       )

                                   )),
                                   DataCell(Text(
                                       "${listState.getRetailerModel?.data?[index].first_name} ${listState.getRetailerModel?.data?[index].last_name}",
                                       style: AppTextStyle.btnTxt15Grayw500.copyWith(fontWeight: FontWeight.w500,color: ColorConstants.blackDarkColor
                                       )
                                   )),
                                   DataCell(Text(dateConverter(listState.getRetailerModel?.data?[index].created_at??""),
                                       style: AppTextStyle.btnTxt15Grayw500.copyWith(fontWeight: FontWeight.w500,color: ColorConstants.blackDarkColor
                                       )
                                     // dateFormat("12/2002/11"),

                                   )),
                                       DataCell(Text(
                                           "${listState.getRetailerModel?.data?[index].buyerCount}",
                                           style: AppTextStyle.btnTxt15Grayw500.copyWith(fontWeight: FontWeight.w500,color: ColorConstants.blackDarkColor
                                           )
                                       )),

                                   DataCell(
                                     Row(
                                       children: [
                                         BlocListener<DeleteRealtorBloc,DeleteRealtorState>(
                                           listener: (context,dltState){
                                             if(dltState is DeleteRealtorLoadingState){
                                                locator<DialogService>().showLoader();
                                             }
                                             else if(dltState is DeleteRealtorSuccessState){
                                               locator<DialogService>().hideLoader();
                                               if(dltState.index == index){
                                                 BlocProvider.of<RealtorListBloc>(context).add(RealtorListRefreshEvent(
                                                     page: page.toString(),
                                                     keyword: keyword
                                                 ));
                                                 locator<ToastService>().showInCenter(dltState.deleteRealtorModel?.message??"");
                                               }
                                               locator<NavigationService>().pop();
                                             }
                                             else if(dltState is DeleteRealtorErrorState){
                                               locator<NavigationService>().pop();
                                               locator<ToastService>().showInCenter(dltState.error);
                                             }
                                           },child: InkWell(
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
                                                     BlocProvider.of<DeleteRealtorBloc>(context).add(DeleteRealtorRefreshEvent(realtorId:listState.getRetailerModel?.data?[index].realtor_id ,index: index));
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
                                                 desc: 'Are you sure you want to delete realtor ?',
                                             ).show();
                                           },
                                           child: Text('Delete',
                                             style: AppTextStyle.btnTxt15Grayw500.copyWith(color: ColorConstants.redColor),),
                                         ),),
                                         const SizedBox(width: 15,),
                                         InkWell(
                                           onTap: (){
                                             DataBean? saveRetailerModel = DataBean(
                                               state: listState.getRetailerModel?.data?[index].state,
                                               city: listState.getRetailerModel?.data?[index].city,
                                               email: listState.getRetailerModel?.data?[index].email,
                                               id: listState.getRetailerModel?.data?[index].id,
                                               country: listState.getRetailerModel?.data?[index].country,
                                               created_at: listState.getRetailerModel?.data?[index].created_at,
                                               deleted_at: listState.getRetailerModel?.data?[index].deleted_at??"",
                                               first_name: listState.getRetailerModel?.data?[index].first_name,
                                               last_name: listState.getRetailerModel?.data?[index].last_name,
                                               phone: listState.getRetailerModel?.data?[index].phone,
                                               realtor_id: listState.getRetailerModel?.data?[index].realtor_id,
                                               street_address2: listState.getRetailerModel?.data?[index].street_address2,
                                               street_address: listState.getRetailerModel?.data?[index].street_address,
                                               zipcode:listState.getRetailerModel?.data?[index].zipcode,
                                             );

                                             BlocProvider.of<RealtorListBloc>(context).add(
                                                 SaveRealtorListRefreshEvent(saveRetailerModel));
                                             BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(6, listState.getRetailerModel?.data?[index].realtor_id));
                                           },
                                           child: Text('Edit >',
                                             style: AppTextStyle.btnTxt15Grayw500.copyWith(color: ColorConstants.greenColor),),
                                         )
                                       ],
                                     ),
                                   )
                                 ]),
                               ),
                             ),
                           ),
                           Padding(
                               padding: const EdgeInsets.symmetric(
                                   horizontal: 18.0, vertical: 20),
                               child: PaginationFooter(
                                 currentPage: page,
                                 totalPage: listState.getRetailerModel?.totalPage,
                                 previousTap: (int prePage) {
                                   if(page>1){
                                     page--;
                                     BlocProvider.of<RealtorListBloc>(context).add(RealtorListRefreshEvent(
                                         page: prePage.toString(),
                                         keyword:  keyword
                                     ));
                                   }
                                 },
                                 nextTap: (int nextPage) {
                                   if((listState.getRetailerModel?.totalPage)!>page){
                                     page++;
                                     BlocProvider.of<RealtorListBloc>(context).add(RealtorListRefreshEvent(
                                         page: nextPage.toString(),
                                         keyword:  keyword
                                     ));
                                   }
                                 },
                                 currentLength:  listState.getRetailerModel?.data?.length??0,
                                 totalLength: int.parse((listState.getRetailerModel?.totalLength??0).toString()),
                               )
                           )

                         ],
                       ),
                     ),
                   ),

                 ),
               );
             }
             else if(listState is RealtorListErrorState){
               return Center(child: Text(listState.error));
             }
             return Container();
           },
         )

       ],
     ),
    );
  }
}
