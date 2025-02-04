part of 'bottom_nav_bar_bloc.dart';

@immutable
class BottomNavBarEvent {}

class HomePageLoad extends BottomNavBarEvent {
  final int index;
  final BuildContext context;

  HomePageLoad(this.index, this.context);
}
