part of 'json_place_holder_bloc.dart';

@immutable
sealed class JsonPlaceHolderEvent {}

class CallJsonPlaceHolderApi extends JsonPlaceHolderEvent {
  final BuildContext ctx;
  CallJsonPlaceHolderApi({required this.ctx});
}
