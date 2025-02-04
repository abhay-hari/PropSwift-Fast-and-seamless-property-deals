part of 'dash_page_bloc.dart';

@immutable
sealed class DashPageEvent {}

class GetAllPlaceList extends DashPageEvent {}

class RemovePlaceFromList extends DashPageEvent {
  final int index;
  final int userId;
  final BuildContext context;

  RemovePlaceFromList(
      {required this.index, required this.context, required this.userId});
}
