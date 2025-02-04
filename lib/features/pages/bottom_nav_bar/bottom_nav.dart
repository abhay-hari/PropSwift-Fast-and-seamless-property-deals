import 'package:propswift/features/bloc/bloc/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'package:propswift/features/pages/bottom_nav_bar/home_page/widget/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propswift/features/widgets/drawer/drawer.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          drawer: DrawerWidget(),
          bottomNavigationBar: CustomBottomNav(
            selectIndex: state.selectIndex,
            onItemTapped: (int index) {
              context
                  .read<BottomNavBarBloc>()
                  .add(HomePageLoad(index, context));
            },
          ),
          body: state.bottomNavPages[state.selectIndex],
        );
      },
    );
  }
}
