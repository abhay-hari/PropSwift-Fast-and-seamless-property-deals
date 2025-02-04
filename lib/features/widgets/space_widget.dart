import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:flutter/material.dart';

class SpaceWidget extends StatelessWidget {
  double? height;
  double? width;
  final BuildContext ctx;
  SpaceWidget({super.key, required this.ctx, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height != null ? height!.rh(ctx) : 0,
      width: width != null ? width!.rf(ctx) : 0,
    );
  }
}
