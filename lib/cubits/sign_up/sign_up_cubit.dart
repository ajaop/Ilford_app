import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ilford_app/helpers/enums.dart';
import 'package:ilford_app/helpers/validator.dart';
import 'package:ilford_app/models/user_details.dart';
import 'package:ilford_app/services/firestore_service.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> with Validator {
  SignUpCubit(this._authenticationRepository, this._firestoreService)
      : super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;
  final FirestoreService _firestoreService;

  void updateFirstName(String? firstName) {
    emit(state.copyWith(firstName: firstName, status: SignUpStatus.initial));
  }

  void updateLastName(String? lastName) {
    emit(state.copyWith(lastName: lastName, status: SignUpStatus.initial));
  }

  // void updatePhone(String? phone) {
  //   emit(state.copyWith(phone: phone));
  // }

  void updateEmail(String? email) {
    emit(state.copyWith(email: email, status: SignUpStatus.initial));
  }

  void updatepassword(String? password) {
    emit(state.copyWith(password: password, status: SignUpStatus.initial));
  }

  void updateConfirmPassword(String? confirmPassword) {
    emit(state.copyWith(
        confirmPassword: confirmPassword, status: SignUpStatus.initial));
  }

  void togglePasswordObscureText() {
    emit(state.copyWith(
        passwordObscureText: !state.passwordObscureText,
        status: SignUpStatus.initial));
  }

  void toggleConfirmPasswordObscureText() {
    emit(state.copyWith(
        confirmPasswordObscureText: !state.confirmPasswordObscureText,
        status: SignUpStatus.initial));
  }

  Future<void> logInWithCredentials() async {
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
    emit(state.copyWith(status: SignUpStatus.loading));
    try {
      await _authenticationRepository.signUp(
        email: state.email,
        password: state.password,
      );
      addUserDetailsToFirestore(UserDetails(
          firstName: state.firstName,
          lastName: state.lastName,
          email: state.email,
          isVerified: false,
          dateAdded: DateTime.now()));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: SignUpStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(
        errorMessage: 'Failed to sign up user',
        status: SignUpStatus.failure,
      ));
    }
  }

  Future<void> addUserDetailsToFirestore(UserDetails userDetails) async {
    try {
      await _firestoreService.addUserDetails(UserDetails(
          firstName: state.firstName,
          lastName: state.lastName,
          email: state.email,
          isVerified: false,
          dateAdded: DateTime.now()));
      emit(state.copyWith(status: SignUpStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to upload user details',
          status: SignUpStatus.failure,
        ),
      );
    }
  }
}
