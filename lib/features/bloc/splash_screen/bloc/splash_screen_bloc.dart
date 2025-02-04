import 'package:propswift/config/routes/navigation.dart';
import 'package:propswift/config/routes/routes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:propswift/data/source/local/hive_database.dart/user_model.dart';
import 'package:propswift/data/source/local/shared_pref/shared_preference.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenFunction>(splashFunction);
  }
  void splashFunction(
      SplashScreenFunction event, Emitter<SplashScreenState> emit) async {
    User? user = await SharedPreferce.getUser();
    if (user != null) {
      await Future.delayed(
        const Duration(seconds: 3),
      );
      event.ctx.mounted
          ? NavigationService.navigateTo(
              context: event.ctx,
              routeName: Routes.dashBoardPage,
              navigationType: NavType.pushAndRemoveUntil,
            )
          : null;
    } else {
      await Future.delayed(
        const Duration(seconds: 3),
      );
      event.ctx.mounted
          ? NavigationService.navigateTo(
              context: event.ctx,
              routeName: Routes.signinPage,
              navigationType: NavType.pushAndRemoveUntil,
            )
          : null;
    }
  }
}
