import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilford_app/cubits/sign_up/sign_up_cubit.dart';
import 'package:ilford_app/helpers/custom_colors.dart';
import 'package:ilford_app/helpers/enums.dart';
import 'package:ilford_app/helpers/utils.dart';
import 'package:ilford_app/helpers/validator.dart';
import 'package:ilford_app/services/firestore_service.dart';
import 'package:ilford_app/ui/home_screen.dart';
import 'package:ilford_app/ui/signin.dart';
import 'package:ilford_app/ui/widgets/form_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget with Validator {
  SignUp({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomCOlors.green00,
        ),
        useMaterial3: true,
      ),
      home: BlocProvider<SignUpCubit>(
        create: (context) => SignUpCubit(
            context.read<AuthenticationRepository>(), FirestoreService()),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state.status == SignUpStatus.success) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomeScreen(),
                        ));
                  } else if (state.status == SignUpStatus.failure) {
                    Utils.showMessage(
                        state.errorMessage ?? 'Sign Up Failure', context);
                  }
                },
                builder: (context, state) {
                  return Stack(
                    children: [
                      Visibility(
                        visible: state.status == SignUpStatus.loading,
                        child: const Center(
                          child: SizedBox(
                            height: 50.0,
                            width: 50.0,
                            child: CircularProgressIndicator(
                              color: CustomCOlors.primaryColor,
                              strokeWidth: 6.0,
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Center(
                                    child: Text('Sign Up',
                                        style: GoogleFonts.robotoSerif(
                                            fontSize: 38.0,
                                            fontWeight: FontWeight.bold,
                                            color: CustomCOlors.black01)),
                                  ),
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                  FormInput(
                                    label: 'Firstname',
                                    hint: 'John',
                                    prefixIcon:
                                        const Icon(Icons.person_outline),
                                    suffixIcon: null,
                                    validator: validateFirstName,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onChanged: context
                                        .read<SignUpCubit>()
                                        .updateFirstName,
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  FormInput(
                                    label: 'Lastname',
                                    hint: 'Doe',
                                    prefixIcon:
                                        const Icon(Icons.person_outline),
                                    suffixIcon: null,
                                    validator: validateLastName,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onChanged: context
                                        .read<SignUpCubit>()
                                        .updateLastName,
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  FormInput(
                                    label: 'Email',
                                    hint: 'doe@gmail.com',
                                    prefixIcon:
                                        const Icon(Icons.email_outlined),
                                    suffixIcon: null,
                                    validator: validateEmail,
                                    keyboardType: TextInputType.emailAddress,
                                    textCapitalization: TextCapitalization.none,
                                    onChanged:
                                        context.read<SignUpCubit>().updateEmail,
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  FormInput(
                                    label: 'Password',
                                    hint: '********',
                                    prefixIcon: const Icon(Icons.lock_outlined),
                                    suffixIcon: IconButton(
                                        onPressed: context
                                            .read<SignUpCubit>()
                                            .togglePasswordObscureText,
                                        icon: Icon(state.passwordObscureText
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined)),
                                    validator: validatePassword,
                                    keyboardType: TextInputType.visiblePassword,
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: state.passwordObscureText,
                                    onChanged: context
                                        .read<SignUpCubit>()
                                        .updatepassword,
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  FormInput(
                                      label: 'Confirm Password',
                                      hint: '********',
                                      prefixIcon:
                                          const Icon(Icons.lock_outlined),
                                      suffixIcon: IconButton(
                                          onPressed: context
                                              .read<SignUpCubit>()
                                              .toggleConfirmPasswordObscureText,
                                          icon: Icon(state
                                                  .confirmPasswordObscureText
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined)),
                                      validator: (value) =>
                                          validateConfirmPassword(
                                            value,
                                            state.password,
                                          ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText:
                                          state.confirmPasswordObscureText,
                                      onChanged: context
                                          .read<SignUpCubit>()
                                          .updateConfirmPassword),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor:
                                              CustomCOlors.primaryColor,
                                          minimumSize:
                                              const Size.fromHeight(55),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          textStyle: GoogleFonts.robotoSerif()),
                                      onPressed: state.status !=
                                              SignUpStatus.loading
                                          ? () async =>
                                              _formKey.currentState!.validate()
                                                  ? await context
                                                      .read<SignUpCubit>()
                                                      .signUpFormSubmitted()
                                                  : print('no form key')
                                          : null,
                                      child: const Text('Sign Up')),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Already have an account ?'),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              foregroundColor:
                                                  CustomCOlors.primaryColor),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          SignIn(),
                                                ));
                                          },
                                          child: const Text('Sign in')),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
