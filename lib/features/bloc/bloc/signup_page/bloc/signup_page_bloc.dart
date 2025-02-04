import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_page_event.dart';
part 'signup_page_state.dart';

class SignupPageBloc extends Bloc<SignupPageEvent, SignupPageState> {
  SignupPageBloc()
      : super(SignupPageInitial(
            selectedRadio: 0, obscureText1: true, obscureText2: true)) {
    on<OnRadioButtonTapped>(_selectRadioButton);
    on<ObscureTextOne>(_changeObscureText1);
    on<ObscureTextTwo>(_changeObscureText2);
  }
  void _selectRadioButton(OnRadioButtonTapped event, Emitter emit) {
    emit(state.copyWith(selectedRadio: event.selectedButton));
  }

  void _changeObscureText1(ObscureTextOne event, Emitter emit) {
    emit(state.copyWith(obscureText1: !state.obscureText1));
  }

  void _changeObscureText2(ObscureTextTwo event, Emitter emit) {
    emit(state.copyWith(obscureText2: !state.obscureText2));
  }
}
