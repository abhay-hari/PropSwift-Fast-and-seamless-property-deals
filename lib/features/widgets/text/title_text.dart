import 'package:clean_archtecture_template_abhay/core/utils/responsive_size/responsive_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/responsive_size/rsp_textstyle.dart';

class TitleText extends StatelessWidget {
  final String text;
  FontWeight? fontWeight;
  FontColor? color;
  TitleText(
      {super.key, required this.text, required this.fontWeight, this.color});

  @override
  Widget build(BuildContext context) {
    // final textStyle = Theme.of(context).textTheme;
    return Text(text,
        style:
            // textStyle.bodyMedium!.copyWith(fontWeight: fontWeight, color: color),
            UiUtils.textStyleFont(context,
                fz: fontSize.sixteen.value.rf(context),
                fc: color,
                fw: fontWeight ?? FontWeight.w400));
  }
}
