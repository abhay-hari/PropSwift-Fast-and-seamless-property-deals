import 'package:flutter/material.dart';
import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:propswift/features/widgets/text/title_text.dart';

class DrawerCustomTiles extends StatelessWidget {
  String text;
  IconData icon;
  Function() onTap;
  DrawerCustomTiles(this.text, this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 10.rw(context),
          ),
          Icon(
            icon, size: fontSize.twentyFour.value.rf(context), //25.sp,
          ),
          SizedBox(
            width: 35.rw(context),
          ),
          TitleText(text: text, fontWeight: FontWeight.w400),
          const Spacer(flex: 1),
          Icon(
            Icons.arrow_forward_ios,
            size: fontSize.twenty.value.rf(context), // ,20.sp,
          ),
          SizedBox(
            width: 5.rw(context),
          )
        ],
      ),
    );
  }
}
