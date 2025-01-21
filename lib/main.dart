import 'package:clean_archtecture_template_abhay/config/routes/routes.dart';
import 'package:clean_archtecture_template_abhay/core/config/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/bloc_provider/multi_bloc_provider_list.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: BlocProvidersList.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      routes: Routes.allRoutes,
      initialRoute: Routes.splashPage,
    );
  }
}
