import 'package:flutter/material.dart';
import 'package:hsca/common/constant/color_constants.dart';
import 'package:hsca/common/constant/image.dart';
import 'package:hsca/common/constant/text_style_common.dart';

class PaginationFooter extends StatelessWidget {
  void Function(int page)? previousTap;
  void Function(int page)? nextTap;
  final int currentPage;
  final int totalPage;
  final int totalLength;
  final int currentLength;

  PaginationFooter(
      {Key? key,
      required this.previousTap,
      required this.nextTap,
      required this.currentPage,
      required this.totalPage, required this.totalLength, required this.currentLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Displaying $currentLength out of $totalLength',
                style: AppTextStyle.detailStyle16blw500.copyWith(fontSize: 14,color:ColorConstants.blackLightColor)
            ),
            Row(
              children: [
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    if (currentPage > 1) {
                      previousTap!(currentPage - 1);
                    }
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: currentPage == 1
                          ? ColorConstants.greyLightColor
                          : ColorConstants.greyLightColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(3),
                      ),
                    ),
                    child: Image.asset(ImageControl.arrowLeft,scale: 3,color: ColorConstants.themeColor,)
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '$currentPage-$totalPage',
                  style: AppTextStyle.detailStyle16blw500.copyWith(fontSize: 14,color:ColorConstants.blackLightColor)
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    if (currentPage < totalPage) {
                      nextTap!(currentPage + 1);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: currentPage == totalPage
                          ? ColorConstants.greyLightColor
                          : ColorConstants.greyLightColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(3),
                      ),
                    ),
                    child: Image.asset(ImageControl.arrowBack,scale: 3,color: ColorConstants.themeColor,)

                    //
                    // SvgPicture.asset("assets/images/arrow_right.svg",
                    //     color: currentPage == totalPage
                    //         ? ColorControl.themeColor
                    //         : ColorControl.colorWhite),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
