import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomViewAllCard extends StatelessWidget {
  Color backgroundColor;
  String title;
  IconData icon;
  String subText;

  CustomViewAllCard(
      {super.key,
      required this.backgroundColor,
      required this.icon,
      required this.subText,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.only(right: 12, left: 8, top: 8, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: backgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                      color: ColorConstants.WHITE,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(icon, color: ColorConstants.WHITE),
                    SizedBox(width: 5.5),
                    Text(
                      subText,
                      style: GoogleFonts.montserrat(
                          color: ColorConstants.WHITE,
                          fontWeight: FontWeight.normal,
                          fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.WHITE, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                children: [
                  Text(
                    "View All",
                    style: GoogleFonts.montserrat(
                        color: ColorConstants.WHITE,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  Icon(
                    Icons.arrow_forward_outlined,
                    color: ColorConstants.WHITE,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
