import 'package:bloc/bloc.dart';
import 'package:clean_archtecture_template_abhay/domain/usecases/json_usecases.dart';
import 'package:flutter/material.dart';

part 'json_place_holder_event.dart';
part 'json_place_holder_state.dart';

class JsonPlaceHolderBloc
    extends Bloc<JsonPlaceHolderEvent, JsonPlaceHolderState> {
  JsonPlaceHolderBloc()
      : super(JsonPlaceHolderInitial(text: "Press the button to load data")) {
    on<CallJsonPlaceHolderApi>(_onClickEvent);
  }
  void _onClickEvent(CallJsonPlaceHolderApi event, Emitter emit) async {
    emit(JsonPlaceHolderLoading(text: state.text));
    final data = await JsonUsecases.callJsonPlaceholderApi(context: event.ctx);
    if (data.isEmpty || data == "") {
      emit(ErrorState(text: "An error occured"));
    } else {
      emit(JsonPlaceHolderSuccess(text: data));
    }
  }
}
