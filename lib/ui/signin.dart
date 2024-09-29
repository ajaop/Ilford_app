import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilford_app/cubits/sign_in/sign_in_cubit.dart';
import 'package:ilford_app/helpers/custom_colors.dart';
import 'package:ilford_app/ui/home_screen.dart';
import 'package:ilford_app/ui/signup.dart';
import 'package:ilford_app/ui/widgets/form_input.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

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
        home: BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
          child: Scaffold(
            body: SafeArea(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: BlocBuilder<SignInCubit, SignInState>(
                builder: (context, state) {
                  return Form(
                      key: _formKey,
                      child: Center(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Center(
                              child: Text('Sign In',
                                  style: GoogleFonts.robotoSerif(
                                      fontSize: 38.0,
                                      fontWeight: FontWeight.bold,
                                      color: CustomCOlors.black01)),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Phone Number',
                                    style: GoogleFonts.robotoSerif(
                                        fontSize: 16.0)),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                IntlPhoneField(
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(Icons.phone_outlined),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintStyle: GoogleFonts.robotoSerif()),
                                    initialCountryCode: 'NG',
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    disableLengthCheck: true,
                                    pickerDialogStyle: PickerDialogStyle(
                                        backgroundColor: Colors.white),
                                    onChanged: (phone) {
                                      context.read<SignInCubit>().updatePhone;
                                    }),
                              ],
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            FormInput(
                              label: 'Password',
                              hint: '********',
                              prefixIcon: const Icon(Icons.lock_outlined),
                              suffixIcon: IconButton(
                                  onPressed: context
                                      .read<SignInCubit>()
                                      .togglePasswordObscureText,
                                  icon: Icon(state.passwordObscureText
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined)),
                              keyboardType: TextInputType.visiblePassword,
                              textCapitalization: TextCapitalization.none,
                              obscureText: state.passwordObscureText,
                              onChanged:
                                  context.read<SignInCubit>().updatepassword,
                            ),
                            SizedBox(
                              height: 70.0,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: CustomCOlors.primaryColor,
                                    minimumSize: const Size.fromHeight(55),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    textStyle: GoogleFonts.robotoSerif()),
                                onPressed: () {
                                  Navigator.pushReplacement<void, void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const HomeScreen(),
                                    ),
                                  );
                                },
                                child: const Text('Sign In')),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don\'t have an account ?'),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        foregroundColor:
                                            CustomCOlors.primaryColor),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                SignUp(),
                                          ));
                                    },
                                    child: const Text('Sign up')),
                              ],
                            )
                          ],
                        ),
                      ));
                },
              ),
            )),
          ),
        ));
  }
}
