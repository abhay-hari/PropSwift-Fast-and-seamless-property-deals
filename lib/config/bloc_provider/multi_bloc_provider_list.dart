import 'package:clean_archtecture_template_abhay/features/bloc/bloc/json_place_holder_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class BlocProvidersList {
  static final List<SingleChildWidget> providers = [
    BlocProvider<JsonPlaceHolderBloc>(
      create: (context) => JsonPlaceHolderBloc(),
    ),
  ];
}
