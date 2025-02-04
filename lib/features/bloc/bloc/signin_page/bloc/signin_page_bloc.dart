import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_page_event.dart';
part 'signin_page_state.dart';

class SigninPageBloc extends Bloc<SigninPageEvent, SigninPageState> {
  SigninPageBloc() : super(SigninPageInitial(obsucreText: true)) {
    on<ChangeObscureText>(_changeObscureText);
  }
  void _changeObscureText(ChangeObscureText event, Emitter emit) {
    emit(state.copyWith(obsucreText: !state.obsucreText));
  }
}
