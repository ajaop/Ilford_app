import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilford_app/cubits/sign_up/sign_up_cubit.dart';
import 'package:ilford_app/helpers/custom_colors.dart';
import 'package:ilford_app/services/firestore_service.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails({super.key});

  final _formKey = GlobalKey<FormState>();
  final List<String> list = <String>['Male', 'Female'];

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
                  child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return Column(children: [
                      Expanded(
                          child: ListView(
                        children: [
                          Text('Employee Information',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoSerif(
                                  fontSize: 38.0,
                                  fontWeight: FontWeight.bold,
                                  color: CustomCOlors.black01)),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Phone, Gender(Category), Department Name (Category, - retrieve from firestore)

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
                                      context.read<SignUpCubit>().updatePhone;
                                    }),
                                const SizedBox(
                                  height: 40.0,
                                ),

                                Text('Gender',
                                    style: GoogleFonts.robotoSerif(
                                        fontSize: 16.0)),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                DropdownButtonFormField<String>(
                                  hint: Text('Male',
                                      style: GoogleFonts.robotoSerif(
                                          fontSize: 16.0)),
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    context
                                        .read<SignUpCubit>()
                                        .updateGender(value);
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                                const SizedBox(
                                  height: 40.0,
                                ),

                                Text('Department',
                                    style: GoogleFonts.robotoSerif(
                                        fontSize: 16.0)),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                DropdownButtonFormField<String>(
                                  hint: Text('Department of Science',
                                      style: GoogleFonts.robotoSerif(
                                          fontSize: 16.0)),
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    context
                                        .read<SignUpCubit>()
                                        .updateGender(value);
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                      Container(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: CustomCOlors.primaryColor,
                                  minimumSize: const Size.fromHeight(55),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  textStyle: GoogleFonts.robotoSerif()),
                              onPressed: () {},
                              child: const Text('Submit')),
                        ),
                      ),
                    ]);
                  },
                ),
              )
            ],
          ))),
        ));
  }
}
