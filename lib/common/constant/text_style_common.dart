import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hsca/common/constant/sizes.dart';

import 'color_constants.dart';

class AppTextStyle {

  static TextStyle styleHeading24blw700 = GoogleFonts.lato(
    color: ColorConstants.navyBlueColor,
    fontSize: textSize24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle searchStyle16blw400 = GoogleFonts.poppins(
    color: ColorConstants.greySearchColor,
    fontSize: textSize16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle detailStyle16blw500 = GoogleFonts.poppins(
    color: ColorConstants.themeColor,
    fontSize: textSize14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle styleHeading16blw700 = GoogleFonts.roboto(
    color: ColorConstants.navyBlueColor,
    fontSize: textSize16,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleHeading20blw500 = GoogleFonts.roboto(
    color: ColorConstants.themeColor,
    fontSize: textSize23,
    fontWeight: FontWeight.w500,
  );

  static TextStyle styleHeading12blw700 = GoogleFonts.roboto(
    color: ColorConstants.navyBlueColor,
    fontSize: textSize12,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleHeading14blw700 = GoogleFonts.roboto(
    color: ColorConstants.navyBlueColor,
    fontSize: textSize12,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleText24blw700 = GoogleFonts.montserrat(
    color: ColorConstants.blueColor,
    fontSize: textSize24,
    fontWeight: FontWeight.w700,
  );
  static TextStyle styleText18blw300 = GoogleFonts.montserrat(
    color: ColorConstants.whiteColor,
    fontSize: textSize18,
    fontWeight: FontWeight.w300,
  );

  static TextStyle styleHeading20blw700 = GoogleFonts.roboto(
    color: ColorConstants.themeColor,
    fontSize: textSize20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleTxtField16bl2w400 = GoogleFonts.roboto(
    color: ColorConstants.blackColor,
    fontSize: textSize16,
    fontWeight: FontWeight.w400,
  );


  static TextStyle styleTxtField16Grayw400 = GoogleFonts.roboto(
    color: ColorConstants.blackColor,
    fontSize: textSize16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle styleContainer14Grayw600 = GoogleFonts.roboto(
    color: ColorConstants.blackColor,
    fontSize: textSize14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle styleContainer20Blackw600 = GoogleFonts.roboto(
    color: ColorConstants.whiteColor,
    fontSize: textSize20,
    fontWeight: FontWeight.w600,
  );


  static TextStyle btnTxt15Grayw500 = GoogleFonts.roboto(
    color: ColorConstants.blackColor,
    fontSize: textSize15,
    fontWeight: FontWeight.w500,
  );


  static TextStyle sr14Grayw600 = GoogleFonts.roboto(
    color: ColorConstants.themeColor,
    fontSize: textSize14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textHintStyle = GoogleFonts.raleway(
    color: ColorConstants.greyColor,
    fontSize: textSize15,
    fontWeight: FontWeight.w500,
  );


  static TextStyle styleAppBar16w600 = GoogleFonts.roboto(
    color: ColorConstants.themeColor,
    fontSize: textSize16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle styleTxtField13Grayw500 = GoogleFonts.roboto(
    color: ColorConstants.blackColor,
    fontSize: textSize13,
    fontWeight: FontWeight.w500,
  );

  static TextStyle styleTxt16bl2kw500 = GoogleFonts.roboto(
    color: ColorConstants.blackColor,
    fontSize: textSize16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle styleTxt16Whitekw500 = GoogleFonts.roboto(
    color: ColorConstants.whiteColor,
    fontSize: textSize16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle styleTxt16pinkw500 = GoogleFonts.roboto(
    color: ColorConstants.blackColor,
    fontSize: textSize16,
    fontWeight: FontWeight.w500,
  );


  static TextStyle Txt13pinkw600 = GoogleFonts.roboto(
    color: ColorConstants.blackColor,
    fontSize: textSize13,
    fontWeight: FontWeight.w600,
  );

  SizedBox addHeight(double size) => SizedBox(height: size.h);
  SizedBox addWidth(double size) => SizedBox(width: size.w);
  SizedBox addSize(double height, double width) => SizedBox(
    width: width.w,
    height: height.h,
  );


  static const boxShadow = [
    BoxShadow(
      // spreadRadius: 1,
        blurRadius: 1,
        offset: Offset(0, .4),
        color: Colors.black38)
  ];
}

