import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color_constants.dart';
import '../constant/text_style_common.dart';

class CustomTextFieldWeb extends StatelessWidget {
  TextInputType keyboardType;
  String? labelText;
  String? hintText;
  String? headingText;
  Color? fillColor;
  Color? focusColor;
  Color? color;
  Widget? prefix;
  Widget? suffix;
  Widget? prefixIcon;
  int? maxLines;
  int? maxLength;
  bool? obscureText;
  void Function()? onTap;
  TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatters;

  //String Function(String) validator;
  TextEditingController controller = TextEditingController();
  void Function(String)? onSaved;
  void Function(String)? onChanged;

  CustomTextFieldWeb(
      {this.obscureText,
      this.textCapitalization,
      // required this.validator,
      this.prefix,
      this.suffix,
      this.prefixIcon,
      this.onTap,
      this.labelText,
      this.hintText,
      this.focusColor,
      this.inputFormatters,
      this.fillColor,
      required this.controller,
      this.onSaved,
      this.headingText,
      this.onChanged,
      this.color,
      this.keyboardType = TextInputType.multiline,
      this.maxLines,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          textInputAction: TextInputAction.newline,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          cursorColor: ColorConstants.blackColor,
          cursorWidth: 1,
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          maxLines: maxLines,
          keyboardType: keyboardType,
          controller: controller,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          //  onSaved: onSaved,
          style: TextStyle(backgroundColor: color
              // fontWeight: FontWeight.bold
              ),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            fillColor: Colors.white,
            focusColor: Colors.green,
            hintText: hintText,
            hintStyle: AppTextStyle.textHintStyle,
            filled: true,
            labelStyle: TextStyle(
              color: ColorConstants.blackColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: ColorConstants.greyLightColor),
            ),
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: ColorConstants.greyLightColor),
            ),
            errorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: ColorConstants.greyLightColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: ColorConstants.greyLightColor,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),

          onTap: onTap,
        ),
      ],
    );
  }
}
