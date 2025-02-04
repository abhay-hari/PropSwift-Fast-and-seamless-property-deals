part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenEvent {
  const SplashScreenEvent();
}

class SplashScreenFunction extends SplashScreenEvent {
  final BuildContext ctx;
  const SplashScreenFunction({required this.ctx});
}
