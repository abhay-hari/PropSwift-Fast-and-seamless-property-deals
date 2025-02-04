import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final String text;
  String? fontFamily;
  final FontWeight fontWeight;
  FontColor? color;
  SubtitleText(
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
        fz: fontSize.fourteen.value.rf(context),
        fc: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
