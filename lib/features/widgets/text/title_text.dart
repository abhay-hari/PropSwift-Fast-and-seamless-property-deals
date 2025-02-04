import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/responsive_size/rsp_textstyle.dart';

class TitleText extends StatelessWidget {
  final String text;
  String? fontFamily;
  FontWeight? fontWeight;
  FontColor? color;
  TitleText(
      {super.key,
      required this.text,
      required this.fontWeight,
      this.color,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: UiUtils.textStyleFont(
        context,
        fz: fontSize.sixteen.value.rf(context),
        fc: color,
        fw: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily,
      ),
    );
  }
}
