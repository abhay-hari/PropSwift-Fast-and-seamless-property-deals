import 'package:clean_archtecture_template_abhay/features/bloc/bloc/json_place_holder_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<JsonPlaceHolderBloc, JsonPlaceHolderState>(
          builder: (BuildContext context, JsonPlaceHolderState state) {
            if (state is JsonPlaceHolderLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Text(state.text),
              );
            } else {
              return Center(
                child: Text(state.text),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.read<JsonPlaceHolderBloc>().add(
                CallJsonPlaceHolderApi(ctx: context),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
