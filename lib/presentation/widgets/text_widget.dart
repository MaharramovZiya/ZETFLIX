import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_api_bloc/constant/colors/colours.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.bebasNeue(fontSize: 25, color: Colours.lightGray));
  }
}
