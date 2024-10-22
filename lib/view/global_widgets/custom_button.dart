import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:ecommerce_clone_july/view/get_started_screen/get_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.buttonText, this.onButtonPressed});
  final String buttonText;
  final void Function()? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonPressed,
      child: Container(
        alignment: Alignment.center,
        color: ColorConstants.PRIMARY,
        height: 55,
        width: double.infinity,
        child: Text(
          buttonText,
          style: GoogleFonts.montserrat(
              color: ColorConstants.WHITE,
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
      ),
    );
  }
}
