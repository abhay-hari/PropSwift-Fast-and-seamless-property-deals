part of 'bottom_nav_bar_bloc.dart';

@immutable
class BottomNavBarState {
  final List<StatefulWidget> bottomNavPages;
  final int selectIndex;

  const BottomNavBarState({
    required this.bottomNavPages,
    required this.selectIndex,
  });
}

class BottomNavBarInitial extends BottomNavBarState {
  const BottomNavBarInitial(
      {required super.bottomNavPages, required super.selectIndex});
}

class HomePageChangeBottomNavBar extends BottomNavBarState {
  const HomePageChangeBottomNavBar({
    required super.bottomNavPages,
    required super.selectIndex,
  });
}
