import 'package:clean_archtecture_template_abhay/core/utils/responsive_size/responsive_screen.dart';
import 'package:clean_archtecture_template_abhay/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:flutter/material.dart';

class CaptionText extends StatelessWidget {
  final String value;
  final FontWeight fontWeight;
  FontColor? color;
  CaptionText(
      {super.key, required this.value, required this.fontWeight, this.color});
  @override
  Widget build(BuildContext context) {
    // final textStyle = Theme.of(context).textTheme;
    return Text(value,
        style: UiUtils.textStyleFont(context,
            fz: fontSize.twentyFour.value.rf(context), fc: color)
        // textStyle.headlineSmall!
        //     .copyWith(fontWeight: fontWeight, color: color),
        );
  }
}
