import 'package:flutter/material.dart';
import 'package:hsca/common/constant/image.dart';
import 'package:hsca/common/constant/string.dart';
import 'package:hsca/common/constant/text_style_common.dart';

import '../constant/color_constants.dart';

class DrawerMenu extends StatelessWidget {
  final Function(String selected) onTap;

  DrawerMenu({required this.onTap, Key? key}) : super(key: key);

  var selectedTab = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: const BoxDecoration(
          color: ColorConstants.whiteColor, boxShadow: AppTextStyle.boxShadow),
      child: ListView(
        children: [
          Image.asset(
            ImageControl.logo,
            scale: 7,
          ),
          const SizedBox(
            height: 15,
          ),
          drawerListTile(StringControl.tabDashboard, "ic_dashboard", 0),
          const SizedBox(
            height: 15,
          ),
          drawerListTile(StringControl.buyerList, "ic_business", 1),
          const SizedBox(
            height: 15,
          ),
          drawerListTile(StringControl.tabSettings, "ic_users", 2),
          const SizedBox(
            height: 15,
          ),
          drawerListTile(StringControl.tabRealtors, "ic_appointments", 3),
        ],
      ),
    );
  }

  Widget drawerListTile(String title, String svgSrc, int index) {
    return GestureDetector(
      onTap: () {
        onTap(title);
      },
      child: Container(
        color: title == selectedTab
            ? ColorConstants.greyLightColor
            : ColorConstants.greyLightColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          ImageControl.logo,
                          color: title == selectedTab
                              ? ColorConstants.greyLightColor
                              : ColorConstants.blackColor,
                          height: 14,
                          width: 14,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        flex: 4,
                        child: Text(title,
                            style: TextStyle(
                              color: title == selectedTab
                                  ? ColorConstants.greyLightColor
                                  : ColorConstants.blackColor,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                ImageControl.arrow,
                scale: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
