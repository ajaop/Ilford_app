part of 'sign_up_cubit.dart';

final class SignUpState extends Equatable {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final bool passwordObscureText;
  final bool confirmPasswordObscureText;
  final bool isValid;
  final SignUpStatus status;
  final String errorMessage;

  const SignUpState(
      {this.firstName = '',
      this.lastName = '',
      this.phone = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.passwordObscureText = true,
      this.confirmPasswordObscureText = true,
      this.isValid = false,
      this.status = SignUpStatus.initial,
      this.errorMessage = ''});

  @override
  List<Object> get props => [
        firstName,
        lastName,
        phone,
        email,
        password,
        confirmPassword,
        passwordObscureText,
        confirmPasswordObscureText,
        isValid,
        status,
        errorMessage
      ];

  SignUpState copyWith(
      {String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? password,
      String? confirmPassword,
      bool? passwordObscureText,
      bool? confirmPasswordObscureText,
      bool? isValid,
      SignUpStatus? status,
      String? errorMessage}) {
    return SignUpState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        passwordObscureText: passwordObscureText ?? this.passwordObscureText,
        confirmPasswordObscureText:
            confirmPasswordObscureText ?? this.confirmPasswordObscureText,
        isValid: isValid ?? this.isValid,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
