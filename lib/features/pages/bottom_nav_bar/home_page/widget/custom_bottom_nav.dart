import 'package:propswift/core/config/app_color/app_colors.dart';
import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  final int selectIndex;
  final Function(int)? onItemTapped;
  const CustomBottomNav(
      {super.key, required this.selectIndex, required this.onItemTapped});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: AppColor.secondContainerColor,
      backgroundColor: AppColor.whiteColor,
      items: [
        Icon(
          Icons.home,
          color: AppColor.whiteColor,
          size: 35.rf(context),
        ),
        Icon(
          Icons.add,
          color: AppColor.whiteColor,
          size: 35.rf(context),
        ),
      ],
      index: widget.selectIndex,
      onTap: (int index) {
        if (mounted) {
          setState(() {
            widget.onItemTapped!(index);
          });
        }
      },
    );
  }
}
