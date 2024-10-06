part of 'sign_up_cubit.dart';

final class SignUpState extends Equatable {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final String gender;
  final bool passwordObscureText;
  final bool confirmPasswordObscureText;
  final SignUpStatus status;
  final String? errorMessage;

  const SignUpState(
      {this.firstName = '',
      this.lastName = '',
      this.phone = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.gender = '',
      this.passwordObscureText = true,
      this.confirmPasswordObscureText = true,
      this.status = SignUpStatus.initial,
      this.errorMessage});

  @override
  List<Object> get props => [
        firstName,
        lastName,
        phone,
        email,
        password,
        confirmPassword,
        gender,
        passwordObscureText,
        confirmPasswordObscureText,
        status
      ];

  SignUpState copyWith(
      {String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? password,
      String? confirmPassword,
      String? gender,
      bool? passwordObscureText,
      bool? confirmPasswordObscureText,
      SignUpStatus? status,
      String? errorMessage,
      AutovalidateMode? autovalidateMode}) {
    return SignUpState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        gender: gender ?? this.gender,
        passwordObscureText: passwordObscureText ?? this.passwordObscureText,
        confirmPasswordObscureText:
            confirmPasswordObscureText ?? this.confirmPasswordObscureText,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
