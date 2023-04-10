import 'package:flutter/material.dart';
import 'package:hsca/common/constant/color_constants.dart';

class AppBarView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: const Color(0xFFFFFFFF),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Icon(Icons.notifications_none_rounded,color: Colors.black,),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              //   color: ColorControl.themeColor
            ),
            child: const Icon(Icons.person,color: Colors.white,),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text("Hello, Admin",style: TextStyle(color: ColorConstants.navyBlueColor),
          )
        ],
      ),
    );
  }
}
