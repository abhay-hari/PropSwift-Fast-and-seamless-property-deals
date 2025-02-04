import 'package:propswift/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:propswift/features/widgets/text/custom_text.dart';
import 'package:propswift/features/widgets/text/subtitle_text.dart';
import 'package:propswift/features/widgets/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class PlatformAlertBox extends StatelessWidget {
  final String title;
  final String content;
  final bool isNeedTwoButton;
  final String secondButtonText;
  VoidCallback? onConfirm;
  // VoidCallback? onCancel;

  PlatformAlertBox({
    super.key,
    required this.title,
    required this.content,
    this.onConfirm,
    required this.isNeedTwoButton,
    required this.secondButtonText,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: TitleText(text: title, fontWeight: FontWeight.w500),
        content: SubtitleText(text: content, fontWeight: FontWeight.w500),
        actions: [
          if (isNeedTwoButton)
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CustomText(
                text: 'cancel',
                fontsize: 12,
                textColor: FontColor.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          CupertinoDialogAction(
            onPressed: onConfirm,
            child: CustomText(
              text: secondButtonText,
              fontsize: 12,
              textColor: FontColor.blueAccentColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: TitleText(text: title, fontWeight: FontWeight.w500),
        content: SubtitleText(text: content, fontWeight: FontWeight.w500),
        actions: [
          if (isNeedTwoButton)
            TextButton(
              onPressed: onConfirm,
              child: CustomText(
                text: secondButtonText,
                fontsize: 14,
                textColor: FontColor.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: CustomText(
              text: "Cancel",
              fontsize: 14,
              textColor: FontColor.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }
  }
}

//! usage
// /*
void showPlatformAlert(
    {required BuildContext context,
    required String title,
    required String content,
    required String secondButtonName,
    Function()? function,
    required bool isTwoButtonNeed}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return PlatformAlertBox(
        title: title,
        content: content,
        onConfirm: function ?? () {},
        isNeedTwoButton: isTwoButtonNeed,
        secondButtonText: secondButtonName,
      );
    },
  );
}
