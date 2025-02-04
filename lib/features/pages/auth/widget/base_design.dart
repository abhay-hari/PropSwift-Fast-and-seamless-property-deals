import 'package:propswift/config/image_path/image_path.dart';
import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:propswift/features/widgets/space_widget.dart';
import 'package:propswift/features/widgets/text/caption_text.dart';
import 'package:propswift/features/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class BaseDesign extends StatelessWidget {
  const BaseDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 600.rh(context),
            width: 350.rw(context),
            // color: Colors.green,
            child: Image.asset(ImagePath.authMainImage),
          ),
        ),
        SpaceWidget(
          ctx: context,
          height: 15,
        ),
        CaptionText(value: "PropSwift", fontWeight: FontWeight.w800),
        SpaceWidget(
          ctx: context,
          height: 15,
        ),
        CustomText(
          text: "Fast and seamless",
          fontsize: 18,
          textColor: FontColor.blackColor,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
          fontFamily: "Inter",
        ),
        SpaceWidget(
          ctx: context,
          height: 3,
        ),
        CustomText(
          text: "property deals",
          fontsize: 18,
          textColor: FontColor.blackColor,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
          fontFamily: "Inter",
        ),
      ],
    );
  }
}
