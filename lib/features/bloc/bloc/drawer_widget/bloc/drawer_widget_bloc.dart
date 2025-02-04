import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:propswift/data/source/local/hive_database.dart/user_model.dart';
import 'package:propswift/data/source/local/shared_pref/shared_preference.dart';

part 'drawer_widget_event.dart';
part 'drawer_widget_state.dart';

class DrawerWidgetBloc extends Bloc<DrawerWidgetEvent, DrawerWidgetState> {
  DrawerWidgetBloc() : super(DrawerWidgetInitial(name: 'Name')) {
    on<GetNameEvent>(_getNameOfUser);
  }
  Future<void> _getNameOfUser(GetNameEvent event, Emitter emit) async {
    final User? user = await SharedPreferce.getUser();
    if (user != null) {
      emit(state.copyWith(name: user.name));
    }
  }
}
