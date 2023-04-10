import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/color_constants.dart';

class CustomField extends StatelessWidget {
  TextInputType? keyboardType;
  String labelText;
  String? headingText;
  Color fillColor;
  Widget? prefix;
  Widget? prefixIcon;
  Widget? suffix;
  int? maxLines;
  int? maxLength;
  bool? obscureText;
  void Function()? onTap;
  TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  TextEditingController controller = TextEditingController();
  void Function(String?)? onSaved;
  void Function(String?)? onChange;
  CustomField(
      {this.obscureText,
      this.textCapitalization,
       this.validator,
      this.prefix,
      this.suffix,
       this.prefixIcon,
      this.onTap,
      this.inputFormatters,
      required this.fillColor,
      required this.controller,
      required this.labelText,
      this.onSaved,
        this.onChange,
      this.headingText,
      this.keyboardType = TextInputType.multiline,
      this.maxLines,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     //   Text(headingText ?? "", style: AppTextStyle.size14gw500),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            textInputAction: TextInputAction.newline,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
        //    cursorColor: ColorConstants.themeColor,
            cursorWidth: 1,
            validator: validator,
            onChanged: onChange,
            obscureText: obscureText ?? false,
            maxLines: maxLines,
            keyboardType: keyboardType,
            controller: controller,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            onSaved: onSaved,
            style: const TextStyle(
              color: Colors.black,
              // fontWeight: FontWeight.bold
            ),
            decoration: InputDecoration(
              counterText: "",
              alignLabelWithHint: true,
              prefix: prefix,
              suffixIcon: suffix,
              fillColor: fillColor,
              filled: true,
              hintText: labelText,
             // labelStyle: AppTextStyle.size14gw500,
             // hintStyle: AppTextStyle.size14gw500,
              errorStyle: TextStyle(
                color: Colors.red,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorConstants.textFieldColor),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorConstants.textFieldColor),
                borderRadius: BorderRadius.circular(5),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorConstants.textFieldColor),
                borderRadius: BorderRadius.circular(5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorConstants.textFieldColor),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
