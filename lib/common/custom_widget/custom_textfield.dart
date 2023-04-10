import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color_constants.dart';
import '../constant/text_style_common.dart';

class CustomTextField extends StatelessWidget {
  TextInputType keyboardType;
  String? labelText;
  String? headingText;
  Color? fillColor;
  Color? colors;
  Color? color;
  Widget? prefix;
  Widget? suffix;
  Widget? prefixIcon;
  int? maxLines;
  int? maxLength;
  bool? obscureText;
  bool? isMandatory = false;
  Key? formKey;
  void Function()? onTap;
  TextCapitalization?  textCapitalization;
  List<TextInputFormatter>?  inputFormatters;
  final String? Function(String?)? validation;
  TextEditingController controller = TextEditingController();
  void Function(String)? onSaved;
  void Function(String)? onChanged;
  CustomTextField({super.key,
    this.obscureText,
    this.textCapitalization,
    this.prefix,
    this.suffix,
    this.onTap,
    this.inputFormatters,
    this.fillColor,
    required this.controller,
    this.labelText,
    this.maxLines,
    this.isMandatory,
    this.prefixIcon,
    this.colors,
    this.color,
    this.formKey,
    this.onSaved,
    this.headingText,
    this.onChanged,
    this.validation,
    this.keyboardType= TextInputType.multiline, this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: isMandatory==true ?Text("${headingText??" "}*",style: AppTextStyle.styleContainer14Grayw600.copyWith(color: ColorConstants.themeColor,fontSize: 17)):
          Text(headingText??"",style: AppTextStyle.styleContainer14Grayw600.copyWith(color: ColorConstants.themeColor,fontSize: 17)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: TextFormField(
            textInputAction: TextInputAction.newline,
            inputFormatters: inputFormatters,
            maxLength: maxLength??100,
            cursorColor: ColorConstants.blackColor,
            cursorWidth: 1,
            validator: validation,
            onChanged: onChanged,
            obscureText: obscureText??false,
            maxLines: maxLines,
            keyboardType: keyboardType,
            controller: controller,
            textCapitalization: textCapitalization??TextCapitalization.none,
            //  onSaved: onSaved,
            style:  TextStyle(
              color:colors,
              // fontWeight: FontWeight.bold
            ),
            decoration: InputDecoration(
              counterText: "",
              alignLabelWithHint: true,
              prefix: prefix,
              suffixIcon: suffix,
              prefixIcon: prefixIcon,
              fillColor: fillColor,
              filled: true,
              hintText: labelText,
              labelStyle: TextStyle(
                color: ColorConstants.greenColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              hintStyle: TextStyle(
                color: color,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: ColorConstants.greyLightColor),
              ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: ColorConstants.greyLightColor),
              ),
              errorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: ColorConstants.greyLightColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: ColorConstants.greyLightColor,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}