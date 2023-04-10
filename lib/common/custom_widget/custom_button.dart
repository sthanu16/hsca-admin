
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color_constants.dart';


class CustomButton extends StatelessWidget
{
  double? buttonWidth = 0;
  void Function() onTap;
  String? text;
  double? buttonHeight;
  double? textSize;
  Color? buttonColor;
  Color? textColor;
  double? horizontal;
  CustomButton({ Key? key,this.textSize = 16, this.horizontal, this.buttonHeight = 50,  this.buttonWidth, this.textColor, required this.onTap,  this.text, this.buttonColor = ColorConstants.blackColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: buttonHeight,
        // width: buttonWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: buttonColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(text??"",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            color: textColor,
            fontSize: textSize,
          )
        ),
      ),

    );
  }
}