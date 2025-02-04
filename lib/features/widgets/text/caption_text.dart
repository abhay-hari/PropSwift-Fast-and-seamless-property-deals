import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:flutter/material.dart';

class CaptionText extends StatelessWidget {
  final String value;
  String? fontFamily;
  final FontWeight fontWeight;
  FontColor? color;
  CaptionText(
      {super.key,
      required this.value,
      required this.fontWeight,
      this.color,
      this.fontFamily});
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: UiUtils.textStyleFont(context,
          fz: fontSize.twentyFour.value.rf(context),
          fc: color,
          fontFamily: fontFamily),
    );
  }
}
