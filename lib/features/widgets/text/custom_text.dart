import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  String? fontFamily;
  TextAlign? textAlign;
  TextDecoration? lineThroughText;
  final double fontsize;
  final FontColor? textColor;
  final FontWeight fontWeight;
  CustomText({
    super.key,
    TextAlign? textAlign,
    String? fontFamily,
    TextDecoration? closeText,
    required this.text,
    required this.fontsize,
    required this.textColor,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: UiUtils.textStyleFont(context,
          fz: fontsize.rf(context),
          fc: textColor,
          fw: fontWeight,
          closeText: lineThroughText,
          fontFamily: fontFamily),
    );
  }
}
