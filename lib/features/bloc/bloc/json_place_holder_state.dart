part of 'json_place_holder_bloc.dart';

@immutable
sealed class JsonPlaceHolderState {
  final String text;

  const JsonPlaceHolderState({required this.text});
  JsonPlaceHolderState copyWith({
    String? text,
  });
}

final class JsonPlaceHolderInitial extends JsonPlaceHolderState {
  const JsonPlaceHolderInitial({required super.text});

  @override
  JsonPlaceHolderState copyWith({
    String? text,
  }) {
    return JsonPlaceHolderInitial(text: text ?? this.text);
  }
}

final class JsonPlaceHolderLoading extends JsonPlaceHolderState {
  const JsonPlaceHolderLoading({required super.text});

  @override
  JsonPlaceHolderLoading copyWith({
    String? text,
  }) {
    return JsonPlaceHolderLoading(text: text ?? this.text);
  }
}

final class JsonPlaceHolderSuccess extends JsonPlaceHolderState {
  const JsonPlaceHolderSuccess({required super.text});

  @override
  JsonPlaceHolderSuccess copyWith({
    String? text,
  }) {
    return JsonPlaceHolderSuccess(text: text ?? this.text);
  }
}

final class ErrorState extends JsonPlaceHolderState {
  const ErrorState({required super.text});

  @override
  ErrorState copyWith({
    String? text,
  }) {
    return ErrorState(text: text ?? this.text);
  }
}
