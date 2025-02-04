part of 'drawer_widget_bloc.dart';

@immutable
sealed class DrawerWidgetState {
  final String name;

  const DrawerWidgetState({required this.name});
  DrawerWidgetState copyWith({String? name});
}

final class DrawerWidgetInitial extends DrawerWidgetState {
  const DrawerWidgetInitial({required super.name});

  @override
  DrawerWidgetState copyWith({String? name}) {
    return DrawerWidgetInitial(name: name ?? this.name);
  }
}
