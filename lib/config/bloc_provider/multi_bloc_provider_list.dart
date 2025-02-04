import 'package:propswift/features/bloc/bloc/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'package:propswift/features/bloc/bloc/dash_page/bloc/dash_page_bloc.dart';
import 'package:propswift/features/bloc/bloc/drawer_widget/bloc/drawer_widget_bloc.dart';
import 'package:propswift/features/bloc/bloc/signin_page/bloc/signin_page_bloc.dart';
import 'package:propswift/features/bloc/bloc/signup_page/bloc/signup_page_bloc.dart';
import 'package:propswift/features/bloc/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class BlocProvidersList {
  static final List<SingleChildWidget> providers = [
    BlocProvider<DrawerWidgetBloc>(
      create: (context) => DrawerWidgetBloc(),
    ),
    BlocProvider<SplashScreenBloc>(
      create: (context) => SplashScreenBloc(),
    ),
    BlocProvider<SignupPageBloc>(
      create: (context) => SignupPageBloc(),
    ),
    BlocProvider<SigninPageBloc>(
      create: (context) => SigninPageBloc(),
    ),
    BlocProvider<BottomNavBarBloc>(
      create: (context) => BottomNavBarBloc(),
    ),
    BlocProvider<DashPageBloc>(
      create: (context) => DashPageBloc(),
    ),
  ];
}
