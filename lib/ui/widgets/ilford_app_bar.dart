import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilford_app/helpers/custom_colors.dart';

class IlfordAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const IlfordAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomCOlors.primaryColor,
      title: Text(title,
          style: GoogleFonts.robotoSerif(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
