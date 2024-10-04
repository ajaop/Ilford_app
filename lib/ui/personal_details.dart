import 'package:flutter/material.dart';
import 'package:ilford_app/helpers/custom_colors.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails({super.key});

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
        home: Scaffold(
            body: SafeArea(
                child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //Phone, Gender(Category), Department Name (Category, - retrieve from firestore)
                    ],
                  ),
                )
              ]))
            ],
          ),
        ))));
  }
}
