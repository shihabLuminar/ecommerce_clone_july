import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
                fit: BoxFit.cover,
                height: 124,
                width: 170,
                "https://images.pexels.com/photos/29041769/pexels-photo-29041769/free-photo-of-charming-sign-pointing-to-happiness-in-ibiza.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          ),
          SizedBox(height: 8),
          Text(
            "Women Printed Kurta",
            textAlign: TextAlign.start,
            style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorConstants.BLACK),
          ),
          SizedBox(height: 4),
          Text(
            "Women Printed Kurta",
            textAlign: TextAlign.start,
            style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: ColorConstants.BLACK),
          ),
          SizedBox(height: 4),
          Text(
            "098765",
            style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorConstants.BLACK),
          ),
          Row(
            children: [
              Text(
                "₹2499",
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: ColorConstants.GREYSHDE6,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: ColorConstants.GREYSHDE6),
              ),
              SizedBox(width: 4),
              Text(
                "40%Off",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: ColorConstants.ORANGE,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              RatingBar.readOnly(
                filledIcon: Icons.star,
                size: 14,
                emptyIcon: Icons.star_border,
                initialRating: 4,
                maxRating: 5,
              ),
              Text(
                "56890",
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  color: ColorConstants.GREYSHDE6,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
