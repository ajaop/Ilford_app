import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInput extends StatelessWidget {
  const FormInput(
      {required this.label,
      required this.hint,
      required this.prefixIcon,
      required this.suffixIcon,
      this.validator,
      required this.keyboardType,
      required this.textCapitalization,
      required this.onChanged,
      this.obscureText = false,
      super.key});

  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.robotoSerif(fontSize: 16.0)),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
            decoration: InputDecoration(
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: hint,
                hintStyle: GoogleFonts.robotoSerif()),
            obscureText: obscureText,
            obscuringCharacter: '*',
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              LengthLimitingTextInputFormatter(100),
            ],
            validator: validator,
            onChanged: onChanged),
      ],
    );
  }
}
