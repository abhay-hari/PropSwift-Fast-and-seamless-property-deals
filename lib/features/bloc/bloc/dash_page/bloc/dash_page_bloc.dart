import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:propswift/core/utils/hive_functions/hive_services.dart';
import 'package:propswift/data/source/local/hive_database.dart/user_model.dart';
import 'package:propswift/data/source/local/shared_pref/shared_preference.dart';

part 'dash_page_event.dart';
part 'dash_page_state.dart';

class DashPageBloc extends Bloc<DashPageEvent, DashPageState> {
  DashPageBloc()
      : super(DashPageInitial(
          id: '',
          allPlaces: [],
          userType: '',
        )) {
    on<GetAllPlaceList>(_getAllPlaces);
    on<RemovePlaceFromList>(_removePlaceFromList);
  }
  void _getAllPlaces(GetAllPlaceList event, Emitter emit) async {
    try {
      User? user = await SharedPreferce.getUser();
      emit(state.copyWith(allPlaces: await HiveServices().getPLaceList()));

      if (user != null) {
        emit(state.copyWith(
            id: user.id.toString(), userType: user.userType.toString()));
      }
    } catch (e) {
      print("error : $e");
    }
  }

  void _removePlaceFromList(RemovePlaceFromList event, Emitter emit) async {
    final List<Place> listOfPlaces = List.from(state.allPlaces!);
    if (event.index >= 0 && event.index < listOfPlaces.length) {
      await HiveServices().deletePlace(event.userId, event.index);
      listOfPlaces.removeAt(event.index);
      emit(state.copyWith(allPlaces: listOfPlaces));
      Navigator.pop(event.context);
    } else {
      print("Invalid index: ${event.index}");
    }
  }
}
