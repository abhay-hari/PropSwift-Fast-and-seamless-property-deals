import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propswift/config/routes/navigation.dart';
import 'package:propswift/config/routes/routes.dart';
import 'package:propswift/core/config/app_color/app_colors.dart';
import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:propswift/data/source/local/hive_database.dart/user_model.dart';
import 'package:propswift/features/bloc/bloc/drawer_widget/bloc/drawer_widget_bloc.dart';
import 'package:propswift/features/widgets/drawer/custom_listtile.dart';
import 'package:propswift/features/widgets/platform_alert.dart';
import 'package:propswift/features/widgets/text/subtitle_text.dart';
import '../../../data/source/local/shared_pref/shared_preference.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    context.read<DrawerWidgetBloc>().add(GetNameEvent());
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.rf(context)),
            bottomRight: Radius.circular(30.rf(context))),
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        shadowColor: AppColor.whiteColor,
        backgroundColor: AppColor.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                DrawerHeader(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.rf(context)),
                        topRight: Radius.circular(15.rf(context))),
                    // color: Colors.green.shade200,
                    gradient: const LinearGradient(
                      colors: [AppColor.linearStart, AppColor.linearEnd],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: height * 0.02, //60.h,
                        left: width * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              maxRadius: 40.rf(context),
                              child: Center(
                                child: Icon(
                                  Icons.person,
                                  size: 35.rf(context),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Expanded(
                              child: BlocBuilder<DrawerWidgetBloc,
                                  DrawerWidgetState>(builder: (context, state) {
                                return SubtitleText(
                                  text: state.name,
                                  fontWeight: FontWeight.w400,
                                  color: FontColor.whiteColor,
                                );
                              }),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 15.rh(context),
                    color: AppColor.drawerTopColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.rh(context),
            ),
            DrawerCustomTiles('Logout', Icons.logout, () {
              showPlatformAlert(
                  context: context,
                  title: 'Logout',
                  content: 'Are you sure you want ’ to Logout',
                  isTwoButtonNeed: true,
                  secondButtonName: 'logout',
                  function: () => logOutApplication(context: context));
            })
          ],
        ),
      ),
    );
  }

  Future<void> logOutApplication({required BuildContext context}) async {
    User? user = await SharedPreferce.getUser();
    if (user != null) {
      await SharedPreferce.removeUser();
      context.mounted
          ? NavigationService.navigateTo(
              context: context,
              routeName: Routes.splashPage,
              navigationType: NavType.pushAndRemoveUntil)
          : null;
    } else {
      context.mounted
          ? NavigationService.navigateTo(
              context: context,
              routeName: Routes.splashPage,
              navigationType: NavType.pushAndRemoveUntil)
          : null;
    }
  }
}
