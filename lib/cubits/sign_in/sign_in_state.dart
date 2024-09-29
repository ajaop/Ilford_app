part of 'sign_in_cubit.dart';

final class SignInState extends Equatable {
  final String phone;
  final String password;
  final bool passwordObscureText;

  const SignInState({
    this.phone = '',
    this.password = '',
    this.passwordObscureText = true,
  });

  @override
  List<Object> get props => [
        phone,
        password,
        passwordObscureText,
      ];

  SignInState copyWith({
    String? phone,
    String? password,
    bool? passwordObscureText,
  }) {
    return SignInState(
        phone: phone ?? this.phone,
        password: password ?? this.password,
        passwordObscureText: passwordObscureText ?? this.passwordObscureText);
  }
}
