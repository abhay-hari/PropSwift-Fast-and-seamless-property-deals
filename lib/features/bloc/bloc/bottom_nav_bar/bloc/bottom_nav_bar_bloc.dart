import 'package:propswift/features/pages/bottom_nav_bar/home_page/dash_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../pages/bottom_nav_bar/home_page/add_place_page.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc()
      : super(BottomNavBarInitial(bottomNavPages: [
          DashPage(),
          AddPlacePage(),
        ], selectIndex: 0)) {
    on<HomePageLoad>(
      (event, emit) {
        emit(
          HomePageChangeBottomNavBar(
            bottomNavPages: [
              const DashPage(),
              const AddPlacePage(),
            ],
            selectIndex: event.index,
          ),
        );
        // }
      },
    );
  }
}
