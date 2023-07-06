import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsca/common/constant/common_funcations.dart';
import 'package:hsca/common/custom_widget/toast_service.dart';
import 'package:hsca/common/locator/locator.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/delete_user_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/user_detail_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/user_list_bloc.dart';

import '../../../common/bloc/navigation_bloc.dart';
import '../../../common/constant/color_constants.dart';
import '../../../common/constant/loader_dialog.dart';
import '../../../common/constant/string.dart';
import '../../../common/constant/text_style_common.dart';
import '../../../common/custom_widget/navigation_service.dart';
import '../../../common/custom_widget/page_bar_view.dart';
import '../../../common/custom_widget/pagination_footer.dart';

class RegisteredUserScreen extends StatefulWidget {
  const   RegisteredUserScreen({Key? key}) : super(key: key);

  @override
  State<RegisteredUserScreen> createState() => _RegisteredUserScreenState();
}

class _RegisteredUserScreenState extends State<RegisteredUserScreen> {

  int page =1;
  int page1 =1;
  String keyword ='';
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

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
              textController: searchController,
              heading: StringControl.buyer,
              title: StringControl.buyerList,
              hintText: "Search by User Name",
              onChange: (String value) {
                keyword = value;
                if (_debounce?.isActive ?? false) _debounce?.cancel();
                _debounce =
                    Timer(const Duration(milliseconds: 500), () {
                      BlocProvider.of<UserListBloc>(context).add(UserListRefreshEvent(
                          page: page1.toString(),
                          keyword:  keyword
                      ));
                    });
              },
            ),
            BlocBuilder<UserListBloc,UserListState>(
              builder: (context, state) {
                if(state is UserListLoadingState){
                  return locator<DialogService>().shimmerEffectUIWidget(context);
                }else if(state is UserListSuccessState){
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
                                  border: TableBorder.all(
                                    width: 0.0,
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  // clipBehavior: Clip.hardEdge,
                                  dataRowHeight: 70,
                                  headingRowHeight: 70,
                                  columnSpacing: 200,
                                  headingRowColor:
                                  MaterialStateColor.resolveWith((states) => ColorConstants.themeColor),
                                  columns: [
                                    DataColumn(
                                      label: Text('S No.',
                                          style: AppTextStyle.styleContainer20Blackw600.copyWith(fontSize: 14)                                    ),
                                    ),
                                    DataColumn(
                                      label: Text('Realtor Reg. Id',
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
                                      label: Text(
                                          'House List',
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
                                    state.userListModel?.data?.length??0,
                                        (index) => DataRow(cells: [
                                      DataCell(Text(
                                          '${((page * 10) - 10) + index + 1}.',
                                          style: AppTextStyle.sr14Grayw600

                                      )),
                                      DataCell(Text(
                                          (state.userListModel?.data?[index].realtor_id is String && (state.userListModel?.data?[index].realtor_id ?? "").toString().isNotEmpty)  ? "#${state.userListModel?.data?[index].realtor_id}" : "",
                                          style: AppTextStyle.sr14Grayw600

                                      )),

                                      DataCell(Text(
                                          "${state.userListModel?.data?[index].first_name} ${state.userListModel?.data?[index].last_name}",
                                          style: AppTextStyle.sr14Grayw600.copyWith(color: ColorConstants.blackLightColor)
                                      )),
                                      DataCell(Text(dateConverter(state.userListModel?.data?[index].created_at??""),
                                          style: AppTextStyle.sr14Grayw600.copyWith(
                                              color: ColorConstants.blackDarkColor
                                          )
                                      )),
                                      DataCell(
                                        Text((state.userListModel?.data?[index].homes ??0).toString(),
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
                                                  // return DialogService().showLoader(context);
                                                }
                                                else if(dltState is DeleteUserListSuccessState){
                                                  // Navigator.pop(context);
                                                  if(dltState.index == index){
                                                    BlocProvider.of<UserListBloc>(context).add(UserListRefreshEvent(
                                                        page: page.toString(),
                                                        keyword: keyword
                                                    ));
                                                    locator<ToastService>().showInCenter(dltState.deleteUserModel?.message??"");
                                                  }
                                                }
                                                else if(dltState is DeleteUserListErrorState){
                                                  locator<ToastService>().showInCenter(dltState.error);
                                                }
                                              },child:  InkWell(
                                              onTap: (){
                                                AwesomeDialog(
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
                                                      BlocProvider.of<DeleteUserListBloc>(context).add(DeleteUserListRefreshEvent(userId:(state.userListModel?.data?[index].id??0).toString() ,index: index));
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
                                                  width: 550,
                                                  context: context,
                                                  dialogType: DialogType.warning,
                                                  animType: AnimType.rightSlide,
                                                  title: 'Delete',
                                                  btnOkText: 'Delete',
                                                  desc: 'Are you sure you want to delete user ?',

                                                ).show();
                                              },
                                              child: Text('Delete',
                                                style: AppTextStyle.sr14Grayw600.copyWith(
                                                    color: ColorConstants.redColor,fontWeight: FontWeight.w500
                                                ),                                            ),
                                            ),),
                                            const SizedBox(width: 14,),
                                            InkWell(
                                              onTap: (){
                                                BlocProvider.of<UserDetailBloc>(context).add(UserDetailRefreshEvent((state.userListModel?.data?[index].id??0).toString()));
                                                BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(5,''));
                                              },
                                              child: Text('View >',
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
                                    currentPage:searchController.text.isNotEmpty?page1: page,
                                    totalPage: state.userListModel?.totalPage,
                                    previousTap: (int prePage) {
                                      if(searchController.text.isNotEmpty){
                                        if(page1>1){
                                          page1--;
                                          BlocProvider.of<UserListBloc>(context).add(UserListRefreshEvent(
                                              page: prePage.toString(),
                                              keyword: keyword
                                          ));
                                        }
                                      }else{
                                        if(page>1){
                                          page--;
                                          BlocProvider.of<UserListBloc>(context).add(UserListRefreshEvent(
                                              page: prePage.toString(),
                                              keyword: keyword
                                          ));
                                        }
                                      }
                                    },
                                    nextTap: (int nextPage) {
                                      if(searchController.text.isNotEmpty){
                                        if((state.userListModel?.totalPage)!>page1){
                                          page1++;
                                          BlocProvider.of<UserListBloc>(context).add(UserListRefreshEvent(
                                              page: nextPage.toString(),
                                              keyword: keyword
                                          ));
                                        }

                                      }else{
                                        if((state.userListModel?.totalPage)!>page){
                                          page++;
                                          BlocProvider.of<UserListBloc>(context).add(UserListRefreshEvent(
                                              page: nextPage.toString(),
                                              keyword: keyword
                                          ));
                                        }

                                      }
                                    },
                                    totalLength: int.parse((state.userListModel?.totalLength??0).toString()),
                                    currentLength:searchController.text.isNotEmpty ?
                                    (page1 ==state.userListModel?.totalPage?(int.parse((state.userListModel?.totalLength??0).toString())):
                                    ((state.userListModel?.data?.length)! * page1 ??0))??0
                                        :(page ==state.userListModel?.totalPage?(int.parse((state.userListModel?.totalLength??0).toString())):
                                    ((state.userListModel?.data?.length)! * page ??0))??0,
                                  )
                              )

                            ],
                          ),
                        ),
                      ),

                    ),
                  );
                }else if(state is UserListErrorState){
                  return Center(child: Text(state.error));
                }else{
                  return Container();
                }
              },

            ),

          ],
        ),
    );
  }
}
