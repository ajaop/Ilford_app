import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());

  void updatePhone(String? phone) {
    emit(state.copyWith(phone: phone));
  }

  void updatepassword(String? password) {
    emit(state.copyWith(password: password));
  }

  void togglePasswordObscureText() {
    emit(state.copyWith(passwordObscureText: !state.passwordObscureText));
  }
}
