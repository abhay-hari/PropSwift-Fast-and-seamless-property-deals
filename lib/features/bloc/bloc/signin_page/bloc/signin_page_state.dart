part of 'signin_page_bloc.dart';

@immutable
sealed class SigninPageState {
  final bool obsucreText;
  const SigninPageState({required this.obsucreText});
  SigninPageState copyWith({bool? obsucreText});
}

class SigninPageInitial extends SigninPageState {
  const SigninPageInitial({required super.obsucreText});

  @override
  SigninPageState copyWith({bool? obsucreText}) {
    return SigninPageInitial(obsucreText: obsucreText ?? this.obsucreText);
  }
}
