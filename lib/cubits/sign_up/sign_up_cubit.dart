import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ilford_app/helpers/enums.dart';
import 'package:ilford_app/helpers/validator.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> with Validator {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  void updateFirstName(String? firstName) {
    emit(state.copyWith(
        firstName: firstName,
        isValid: validateFirstName(firstName) == null ? true : false));
  }

  void updateLastName(String? lastName) {
    emit(state.copyWith(
        lastName: lastName,
        isValid: validateLastName(lastName) == null ? true : false));
  }

  // void updatePhone(String? phone) {
  //   emit(state.copyWith(phone: phone));
  // }

  void updateEmail(String? email) {
    emit(state.copyWith(
        email: email, isValid: validateEmail(email) == null ? true : false));
  }

  void updatepassword(String? password) {
    emit(state.copyWith(
        password: password,
        isValid: validatePassword(password) == null ? true : false));
  }

  void updateConfirmPassword(String? confirmPassword) {
    emit(state.copyWith(
        confirmPassword: confirmPassword,
        isValid:
            validateConfirmPassword(confirmPassword, state.password) == null
                ? true
                : false));
  }

  void togglePasswordObscureText() {
    emit(state.copyWith(passwordObscureText: !state.passwordObscureText));
  }

  void toggleConfirmPasswordObscureText() {
    emit(state.copyWith(
        confirmPasswordObscureText: !state.confirmPasswordObscureText));
  }

  Future<void> logInWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: SignUpStatus.loading));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: SignUpStatus.success));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: SignUpStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: SignUpStatus.failure));
    }
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: SignUpStatus.loading));
    try {
      await _authenticationRepository.signUp(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: SignUpStatus.success));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: SignUpStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: SignUpStatus.failure));
    }
  }
}
