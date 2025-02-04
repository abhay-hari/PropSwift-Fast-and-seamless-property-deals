import 'package:propswift/config/image_path/image_path.dart';
import 'package:propswift/core/config/app_color/app_colors.dart';
import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/features/bloc/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:propswift/features/pages/auth/widget/base_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashScreenBloc>().add(SplashScreenFunction(ctx: context));
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 100.rh(context)),
                  child: SizedBox(
                      height: 100.rh(context),
                      child: Image.asset(ImagePath.logoImage))),
            ),
            BaseDesign(),
          ],
        ),
      ),
      //   BlocBuilder<JsonPlaceHolderBloc, JsonPlaceHolderState>(
      //     builder: (BuildContext context, JsonPlaceHolderState state) {
      //       if (state is JsonPlaceHolderLoading) {
      //         return const Center(
      //           child: CircularProgressIndicator.adaptive(),
      //         );
      //       } else if (state is ErrorState) {
      //         return Center(
      //           child: Text(state.text),
      //         );
      //       } else {
      //         return Center(
      //           child: Text(state.text),
      //         );
      //       }
      //     },
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     context.read<JsonPlaceHolderBloc>().add(
      //           CallJsonPlaceHolderApi(ctx: context),
      //         );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
