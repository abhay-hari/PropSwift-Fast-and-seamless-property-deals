part of 'signup_page_bloc.dart';

@immutable
sealed class SignupPageState {
  final bool obscureText1;
  final bool obscureText2;
  final int selectedRadio;

  const SignupPageState(
      {required this.obscureText1,
      required this.obscureText2,
      required this.selectedRadio});
  SignupPageState copyWith(
      {int? selectedRadio, bool? obscureText1, bool? obscureText2});
}

final class SignupPageInitial extends SignupPageState {
  const SignupPageInitial(
      {required super.selectedRadio,
      required super.obscureText1,
      required super.obscureText2});

  @override
  SignupPageState copyWith(
      {int? selectedRadio, bool? obscureText1, bool? obscureText2}) {
    return SignupPageInitial(
        selectedRadio: selectedRadio ?? this.selectedRadio,
        obscureText1: obscureText1 ?? this.obscureText1,
        obscureText2: obscureText2 ?? this.obscureText2);
  }
}
