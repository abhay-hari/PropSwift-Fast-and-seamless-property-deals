import 'package:clean_archtecture_template_abhay/core/utils/responsive_size/responsive_screen.dart';
import 'package:clean_archtecture_template_abhay/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  FontColor? color;
  SubtitleText(
      {super.key, required this.text, required this.fontWeight, this.color});

  @override
  Widget build(BuildContext context) {
    // final textStyle = Theme.of(context).textTheme;
    return Text(text,
        style: UiUtils.textStyleFont(context,
            fz: fontSize.fourteen.value.rf(context), fc: color)
        // textStyle.bodySmall!.copyWith(fontWeight: fontWeight, color: color),
        );
  }
}
