import 'package:flutter/material.dart';
import 'package:ilford_app/helpers/custom_colors.dart';

class Utils {
  Utils._(); // Private constructor to prevent instantiation

  static void showMessage(String message, BuildContext ctx) {
    ScaffoldMessenger.of(ctx)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: CustomCOlors.primaryColor,
      ));
  }
}
