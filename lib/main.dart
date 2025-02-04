import 'package:propswift/config/routes/routes.dart';
import 'package:propswift/core/config/app_theme/app_theme.dart';
import 'package:propswift/core/utils/hive_functions/hive_services.dart';
import 'package:propswift/data/source/local/hive_database.dart/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'config/bloc_provider/multi_bloc_provider_list.dart';

void main() async {
  HiveServices hiveServices = HiveServices();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(PlaceAdapter());
  await hiveServices.openUserHiveBox();
  await hiveServices.openPlaceHiveBox();
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
