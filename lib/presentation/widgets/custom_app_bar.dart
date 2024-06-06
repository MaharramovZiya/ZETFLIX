
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_api_bloc/components/app_strings.dart';
import 'package:movies_api_bloc/constant/colors/colours.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        title: Row(
          children: [
            Text(
              AppStrings.appBarTitle,
              style: GoogleFonts.bebasNeue(
                  color: Colours.darkRed,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 10,
            ),
            const Row(
              children: [
                Text(
                  AppStrings.appBarWatch,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colours.lightGray),
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 32,
                  color: Colours.lightGray,
                ),
              ],
            ),
          ],
        ),
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
