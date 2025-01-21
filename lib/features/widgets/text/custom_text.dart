import 'package:clean_archtecture_template_abhay/core/utils/responsive_size/responsive_screen.dart';
import 'package:clean_archtecture_template_abhay/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  TextAlign? textAlign;
  TextDecoration? lineThroughText;
  final double fontsize;
  final FontColor? textColor;
  final FontWeight fontWeight;
  CustomText({
    super.key,
    TextAlign? textAlign,
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
          closeText: lineThroughText),

      // TextStyle(
      //     color: Color(textColor),
      //     fontSize: fontsize,
      //     fontWeight: fontWeight)
    );
    //   Text(
    //     text: value,
    //   textAlign: textAlign,
    //   style: TextStyle(
    //       color: Color(textColor), fontSize: fontsize, fontWeight: FontWeight), ,
    // );
  }
}

// Widget text({
//   TextAlign? textAlign,
//   required String text,
//   required double fontsize,
//   required int textColor,
//   required FontWeight FontWeight,
// }) {
//   return Text(
//     text,
//     textAlign: textAlign,
//     style: TextStyle(
//         color: Color(textColor), fontSize: fontsize, fontWeight: FontWeight),
//   );
// }
