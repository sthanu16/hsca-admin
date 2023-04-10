import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/realtor_edit.dart';
import 'package:hsca/ui/dashboard/dashboard/realtors_screen.dart';
import 'package:hsca/ui/dashboard/dashboard/registered_users_screen.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/dashboard_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/user_list_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/user_details_screen.dart';

import '../../../bloc/get_realtor_bloc.dart';
import '../../../common/bloc/navigation_bloc.dart';
import '../../../common/constant/app_utils.dart';
import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/custom_widget/drawer_screen.dart';
import '../../../common/custom_widget/toast_service.dart';
import '../../../common/locator/locator.dart';
import '../../auth/login/login_screen.dart';
import '../house/house_details_screen.dart';
import '../settings/setting_screen.dart';
import 'add_realtors_screen.dart';
import 'dashboard_tab.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(DashboardRefreshEvent());
    BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(0, ''));
  }

  var selectedTab = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          // AppBarView(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                child: DrawerScreen(),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Container(color: Colors.white,width: double.infinity,height: 60,
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                         //   Image.asset(ImageControl.menu,scale: 4,),
                            Stack(
                              alignment: Alignment.bottomLeft,
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                                  child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorConstants.themeColor,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                                    child: Text("Hello, Admin",style: TextStyle(color: ColorConstants.whiteColor),
                                    ),
                                  ),
                                ),),
                                Positioned(
                                  right: 5,
                                  top: 0.0,
                                  bottom: 0.0,
                                  child: InkWell(
                                    onTap: (){
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Logout?'),
                                            content: const Text('Are you sure you want to logout.'),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:  MaterialStateProperty.all<Color>(ColorConstants.greenColor),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop(false);
                                                },
                                                child: const Text('No'),
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:  MaterialStateProperty.all<Color>(ColorConstants.greenColor),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      builder: (BuildContext context) => const LoginScreen()));
                                                  AppUtils().logoutUser();
                                                  locator<ToastService>().showInCenter( 'Logout Successfully');
                                                },
                                                child: const Text('Yes'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      // showMenu(
                                      //   context: context,
                                      //   position: const RelativeRect.fromLTRB(0, 50, -100, 100),
                                      //   items: [
                                      //     PopupMenuItem<String>(
                                      //         onTap: () {
                                      //
                                      //         },
                                      //         value: 'Logout',
                                      //         child: const Text('Logout')),
                                      //   ],
                                      //   elevation: 8.0,
                                      // );
                                    },
                                    child: Container(
                                      height: 38,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: ColorConstants.whiteColor
                                        ),
                                        color: ColorConstants.greyLightColor,

                                      ),
                                      child: CircleAvatar(
                                          backgroundColor: ColorConstants.greyLightColor,
                                          child: SizedBox(
                                            height: 20,
                                              width: 20,
                                              child: Center(child: Image.asset(ImageControl.person)))),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),),
                    BlocBuilder<BottomNavigationSelectionBloc, BottomNavigationSelectionState>(
                      builder: (context, state) {
                      if(state is BottomNavigationSelectionIndexState){
                        return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 30,
                                  right: 25.0, left: 10.0, bottom: 20),
                              child: showTabs(state.index, state.refId ?? ''),));
                      }return Container();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),


    );
  }

  Widget showTabs(int selectedTab, String refId) {
    if (selectedTab == 0) {
      return const DashboardTab();
    }
    else if (selectedTab == 1) {
      BlocProvider.of<UserListBloc>(context).add(UserListRefreshEvent());
      return const RegisteredUserScreen();
    } else if (selectedTab == 2) {
     //  BlocProvider.of<UserListBloc>(context).add(UserListRefreshEvent());
      return const SettingScreen();
    }
    else if (selectedTab == 3) {
      BlocProvider.of<RealtorListBloc>(context).add(RealtorListRefreshEvent(
       page:  '1',
       keyword:  ''
      ));
      return const RealtorsScreen();
    }
    else if (selectedTab == 4) {
      return const AddRealtorsScreen();
    }else if (selectedTab == 5) {
      return const UserDetailScreen();
    }else if (selectedTab == 6) {
      return const EditRealtorScreen();
    }else if (selectedTab == 7) {
      return const HouseDetailScreen();
    }
    else {
      return const DashboardTab();
    }
  }

}
