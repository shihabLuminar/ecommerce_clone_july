import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIconCard extends StatelessWidget {
  const CustomIconCard(
      {super.key,
      required this.color1,
      required this.color2,
      required this.icon,
      required this.text});
  final Color color1;
  final Color color2;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 136,
        ),
        Positioned(
          top: 2,
          bottom: 2,
          child: Container(
            padding: EdgeInsets.only(left: 48, right: 8),
            width: 136,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [color1, color2])),
            alignment: Alignment.center,
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                color: ColorConstants.WHITE,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [color1, color2])),
          child: Icon(
            icon,
            color: ColorConstants.WHITE,
          ),
        )
      ],
    );
  }
}
