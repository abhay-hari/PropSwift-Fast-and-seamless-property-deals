import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propswift/config/image_path/image_path.dart';
import 'package:propswift/core/config/app_color/app_colors.dart';
import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:propswift/features/bloc/bloc/dash_page/bloc/dash_page_bloc.dart';
import 'package:propswift/features/pages/bottom_nav_bar/home_page/widget/gridview_card.dart';
import 'package:propswift/features/widgets/space_widget.dart';
import 'package:propswift/features/widgets/text/subtitle_text.dart';
import 'package:flutter/material.dart';

class DashPage extends StatefulWidget {
  const DashPage({super.key});

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<DashPageBloc>().add(GetAllPlaceList());
    // });
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            SpaceWidget(
              ctx: context,
              height: 30,
            ),
            Container(
              height: height * 0.14,
              width: width * 0.75,
              decoration: BoxDecoration(
                // color: AppColor.secondContainerColor,
                borderRadius: BorderRadius.circular(35.rf(context)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.rw(context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(
                            Icons.sort,
                            size: 40.rf(context),
                          ),
                        ),
                        SizedBox(
                            // color: Colors.green,
                            height: width * 0.1,
                            child: Image.asset(ImagePath.logoImage)),
                        CircleAvatar(
                          radius: 20.rf(context),
                          child: Center(
                            child: Icon(Icons.person),
                          ),
                        )
                      ],
                    ),
                  ),
                  SpaceWidget(
                    ctx: context,
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.rw(context)),
              child: Container(
                color: AppColor.textFormFieldColor,
                height: 61.rh(context),
                width: 340.rw(context),
                child: TextFormField(
                  decoration:
                      inputMethod(hintText: "Search", icon: Icons.search),
                ),
              ),
            ),
            SpaceWidget(
              ctx: context,
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.rw(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColor.blackColor,
                    size: 20.rf(context),
                  ),
                  SpaceWidget(
                    ctx: context,
                    width: 10,
                  ),
                  SubtitleText(
                    text: "Place",
                    fontWeight: FontWeight.w400,
                    color: FontColor.blackColor,
                  ),
                  SpaceWidget(
                    ctx: context,
                    width: 10,
                  ),
                ],
              ),
            ),
            SpaceWidget(
              ctx: context,
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.rw(context)),
              child: SizedBox(
                height: height * 0.53,
                child: BlocBuilder<DashPageBloc, DashPageState>(
                    builder: (context, state) {
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8.rh(context),
                      crossAxisCount:
                          state.allPlaces == null || state.allPlaces!.isEmpty
                              ? 1
                              : 2,
                      childAspectRatio: 0.92.rh(context), //0.92.rh(context),
                    ),
                    itemCount:
                        state.allPlaces == null || state.allPlaces!.isEmpty
                            ? 1
                            : state.allPlaces!.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (state.allPlaces == null || state.allPlaces!.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: SizedBox(
                            height: height * 0.53,
                            width: width,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('No places to display'),
                            ),
                          ),
                        );
                      } else {
                        final data = state.allPlaces![index];
                        print("index : $index");
                        return GridviewCard(
                          index: index,
                          addedBy: data.addedBy,
                          placeName: data.placeName,
                          usertype: int.parse(state.userType),
                          userID: int.parse(state.id),
                          amount: data.amount.toString(),
                          onPressed: (index) {
                            context.read<DashPageBloc>().add(
                                RemovePlaceFromList(
                                    index: index,
                                    context: context,
                                    userId: data.addedBy));
                          },
                        );
                      }
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  inputMethod({required String hintText, required IconData icon}) {
    return InputDecoration(
      // fillColor: AppColor.greyTextShade,
      prefixIcon: Icon(icon),
      suffixIcon: Icon(Icons.settings_voice_outlined),
      hintText: hintText, //"Username",
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}
