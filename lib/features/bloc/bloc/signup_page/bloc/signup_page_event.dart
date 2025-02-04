part of 'signup_page_bloc.dart';

@immutable
sealed class SignupPageEvent {}

class OnRadioButtonTapped extends SignupPageEvent {
  final int selectedButton;

  OnRadioButtonTapped({required this.selectedButton});
}

class ObscureTextOne extends SignupPageEvent {}

class ObscureTextTwo extends SignupPageEvent {}
