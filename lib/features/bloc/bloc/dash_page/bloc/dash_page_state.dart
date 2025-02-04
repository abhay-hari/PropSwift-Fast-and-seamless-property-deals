part of 'dash_page_bloc.dart';

@immutable
sealed class DashPageState {
  final String id;
  final String userType;
  final List<Place>? allPlaces;

  const DashPageState(
      {required this.id, required this.userType, required this.allPlaces});
  DashPageState copyWith(
      {String? id, String? userType, List<Place>? allPlaces});
}

final class DashPageInitial extends DashPageState {
  const DashPageInitial(
      {required super.id, required super.userType, required super.allPlaces});

  @override
  DashPageState copyWith(
      {String? id, String? userType, List<Place>? allPlaces}) {
    return DashPageInitial(
        id: id ?? this.id,
        userType: userType ?? this.userType,
        allPlaces: allPlaces ?? this.allPlaces);
  }
}
