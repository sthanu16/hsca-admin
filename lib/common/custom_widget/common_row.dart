import 'package:flutter/cupertino.dart';
import 'package:hsca/common/constant/color_constants.dart';

import '../constant/text_style_common.dart';

Widget commonRow(String title,String titleMain){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        flex:1,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            title,
            style: AppTextStyle.detailStyle16blw500
          ),
        ),),
      const SizedBox(width: 8,height: 5,),

      Expanded(
        flex: 2,
        child: Container(
          decoration: const BoxDecoration(
            color: ColorConstants.greyLightColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0),
            ),
          ),
          child:  Padding (
            padding: EdgeInsets.all(
                8),
            child: Text(
              '${titleMain}',
                style: AppTextStyle.detailStyle16blw500.copyWith(fontSize: 14,color: ColorConstants.brownColor)

            ),
          ),
        ),
      ),
    ],
  );
}