import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hsca/common/constant/image.dart';
import 'package:hsca/common/constant/string.dart';
import 'package:hsca/common/constant/text_style_common.dart';

import '../../ui/dashboard/dashboard/user/bloc/dashboard_bloc.dart';
import '../bloc/navigation_bloc.dart';
import '../constant/color_constants.dart';
import '../constant/sizes.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {

    return
      Drawer(
        elevation: 0.0,
      child: Column(
        children: [
          BlocBuilder<BottomNavigationSelectionBloc,BottomNavigationSelectionState>(
            builder: (context,state){
            if(state is BottomNavigationSelectionIndexState){
              return Expanded(
                child: Container(
                  color:Colors.white,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        title: Column(
                          children: [
                            Image.asset(ImageControl.logo, height: 70),
                            const SizedBox(height: 10),
                            Text(StringControl.homeToCheck,style: AppTextStyle.styleHeading20blw700
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25,),
                      Container(
                        color: state.index==0?ColorConstants.greyLightColor:Colors.transparent,
                        child: ListTile(
                          title: Row(
                            children: [
                              SvgPicture.asset(
                                ImageControl.homeIcons,
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  StringControl.tabDashboard,
                                  style: AppTextStyle.styleTxtField16Grayw400.copyWith(color: state.index==0?ColorConstants.navyBlueColor:ColorConstants.blackDarkColor)
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(0,''));
                          },
                        ),
                      ),
                      Container(
                        color: state.index==1?ColorConstants.greyLightColor:Colors.transparent,
                        child: ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageControl.userIcons,
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                    StringControl.buyerList,
                                    style: AppTextStyle.styleTxtField16Grayw400.copyWith(color: state.index==1?ColorConstants.navyBlueColor:ColorConstants.blackDarkColor)
                                ),
                              ),
                                Image.asset(ImageControl.drawer,scale: 4,color: ColorConstants.blackDarkColor,),
                            ],
                          ),
                          onTap: () {
                            BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(1,''));
                          },
                        ),
                      ),
                      Container(
                        color: state.index==3?ColorConstants.greyLightColor:Colors.transparent,
                        child: ListTile(
                          title: Row(
                            children: [
                              SvgPicture.asset(
                                ImageControl.userIcons,
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                    StringControl.realtors,
                                    style: AppTextStyle.styleTxtField16Grayw400.copyWith(color:state.index==3?ColorConstants.navyBlueColor:ColorConstants.blackDarkColor)
                                ),
                              ),
                              Image.asset(ImageControl.drawer,scale: 4,color: ColorConstants.blackDarkColor,),
                            ],
                          ),
                          onTap: () {
                            BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(3,''));
                          },
                        ),
                      ),
                      Container(
                        color: state.index==2?ColorConstants.greyLightColor:Colors.transparent,
                        child: ListTile(
                          title: Row(
                            children: [
                              const SizedBox(width: 4),
                              SvgPicture.asset(
                                ImageControl.settingIcons,
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                    StringControl.settings,
                                    style: AppTextStyle.styleTxtField16Grayw400.copyWith(color: state.index==2?ColorConstants.navyBlueColor:ColorConstants.blackDarkColor)
                                ),
                              ),
                              Image.asset(ImageControl.drawer,scale:4,color: ColorConstants.blackDarkColor,),
                            ],
                          ),
                          onTap: () {
                            BlocProvider.of<BottomNavigationSelectionBloc>(context).add(BottomNavigationSelectionRefreshEvent(2,''));
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }
            else{
              return Container();
            }
          })
        ],
      ),
    );
  }
}
