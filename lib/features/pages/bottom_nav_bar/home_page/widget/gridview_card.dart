import 'package:propswift/config/image_path/image_path.dart';
import 'package:propswift/core/config/app_color/app_colors.dart';
import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/features/widgets/platform_alert.dart';
import 'package:propswift/features/widgets/text/subtitle_text.dart';
import 'package:flutter/material.dart';

class GridviewCard extends StatelessWidget {
  final Function(int index) onPressed;
  final String placeName;
  final int usertype;
  final int userID;
  final int index;
  final String amount;
  final int addedBy;
  const GridviewCard({
    super.key,
    required this.placeName,
    required this.usertype,
    required this.userID,
    required this.amount,
    required this.addedBy,
    required this.index,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.rf(context)),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(20.rf(context))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.rf(context)),
              child: Image.asset(
                ImagePath.propImage,
              ),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SubtitleText(
                  text: placeName,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.rw(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SubtitleText(text: "₹ $amount", fontWeight: FontWeight.w400),
                  Visibility(
                    visible:
                        usertype == 2 && (userID == addedBy || usertype != 2)
                            ? true
                            : userID == addedBy
                                ? true
                                : false,
                    child: IconButton(
                      onPressed: () {
                        showPlatformAlert(
                          context: context,
                          title: "Delete?",
                          content: "Are you sure to Delete ?",
                          isTwoButtonNeed: true,
                          secondButtonName: 'Delete',
                          function: () {
                            onPressed(index);
                          },
                        );
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 20.rf(context),
                        color: AppColor.redColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
