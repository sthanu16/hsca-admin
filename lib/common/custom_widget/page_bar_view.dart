import 'package:flutter/material.dart';
import 'package:hsca/common/constant/color_constants.dart';
import 'package:hsca/common/constant/image.dart';

import '../constant/text_style_common.dart';

class PageBarView extends StatelessWidget {
  final Function(String value) onChange;
  final TextInputType keyboardType;
  final String hintText;
  final String redirection;
  final String title;
  final String heading;
  final TextEditingController? textController;

  const PageBarView(
      {this.keyboardType = TextInputType.text,
      this.hintText = '',
      this.textController,
      this.redirection = '',
      this.title = '',required this.onChange,
      this.heading = '',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(heading,
                      style: AppTextStyle.styleHeading20blw500
                  ),
                  Text(title,
                      style: AppTextStyle.styleAppBar16w600.copyWith(color: ColorConstants.blackLightColor,fontSize: 14)
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0,right: 14),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstants.whiteColor,
                    boxShadow: AppTextStyle.boxShadow,
                    borderRadius: BorderRadius.circular(15)),
                height: 45,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(ImageControl.search,height: 20,),
                      ),
                      Expanded(
                        child: TextField(
                          maxLines: 1,
                          controller: textController,
                          minLines: 1,
                          obscureText: false,
                          style: AppTextStyle.searchStyle16blw400,
                          maxLength: 50,
                          textInputAction: TextInputAction.done,
                          keyboardType: keyboardType,
                          decoration: InputDecoration(
                              isCollapsed: true,
                              border: InputBorder.none,
                              isDense: true,
                              counterText: "",
                              contentPadding: const EdgeInsets.all(0),
                              hintText: hintText,
                              hintStyle: AppTextStyle.searchStyle16blw400.copyWith(fontSize:15 ),
                          ),
                          onChanged: onChange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
