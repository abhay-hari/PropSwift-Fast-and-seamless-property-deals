import 'package:clean_archtecture_template_abhay/core/config/app_color/app_colors.dart';
import 'package:clean_archtecture_template_abhay/core/utils/responsive_size/responsive_screen.dart';
import 'package:flutter/material.dart';

class UiUtils {
  static TextStyle textStyleFont(BuildContext context,
      {FontColor? fc, FontWeight? fw, double? fz, TextDecoration? closeText}) {
    return TextStyle(
      fontSize: fz ?? fontSize.fourteen.value.rf(context),
      fontWeight: fw ?? FontWeight.w500,
      color: fc?.color ?? AppColor.blackColor,
      decoration: closeText ?? TextDecoration.none,
    );
  }
}

enum FontColor {
  blackColor,
  whiteColor,
  appColor,
  greenColor,
  redColor,
  greyColor,
  blueColor,
  blueAccentColor,
  grannyAppleColor,
  selectedCardColor,
  googleSignInButtonColor,
  forgotPasswordButtonColor,
  icebergColor,
  chineseBlackColor,
  redAccentColor,
  greyColorShade,
}

extension FontColorExtension on FontColor {
  Color get color {
    switch (this) {
      case FontColor.blackColor:
        return AppColor.blackColor;
      case FontColor.whiteColor:
        return AppColor.whiteColor;
      case FontColor.appColor:
        return AppColor.primary;
      case FontColor.greenColor:
        return AppColor.greenColor;
      case FontColor.greyColor:
        return AppColor.greyColor;
      case FontColor.blueColor:
        return AppColor.blueColor;
      case FontColor.grannyAppleColor:
        return AppColor.grannyAppleColor;
      case FontColor.selectedCardColor:
        return AppColor.selectedCardColor;
      case FontColor.googleSignInButtonColor:
        return AppColor.googleSignInButtonColor;
      case FontColor.forgotPasswordButtonColor:
        return AppColor.forgotPasswordButtonColor;
      case FontColor.icebergColor:
        return AppColor.icebergColor;
      case FontColor.chineseBlackColor:
        return AppColor.chineseBlackColor;
      case FontColor.redAccentColor:
        return AppColor.redAccentColor;
      case FontColor.redColor:
        return AppColor.redColor;
      case FontColor.blueAccentColor:
        return AppColor.blueAccentColor;
      case FontColor.greyColorShade:
        return AppColor.greyColorShade;
    }
  }
}

// ignore: camel_case_types
enum fontSize {
  nine(9),
  ten(10),
  eleven(11),
  twelve(12),
  thirteen(13),
  fourteen(14),
  fifteen(15),
  sixteen(16),
  seventeen(17),
  twenty(20),
  twentyOne(21),
  twentyFour(24),
  twenytySix(26),
  thirtyFive(35);

  final double value;
  const fontSize(this.value);
}
