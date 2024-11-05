import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistItemCard extends StatelessWidget {
  const WishlistItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.ratings,
    required this.ratingCount,
    required this.price,
    required this.des,
  });

  final String imageUrl;
  final String title;
  final double ratings;
  final int ratingCount;
  final double price;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(fit: BoxFit.cover, imageUrl),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.start,
            style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorConstants.BLACK),
          ),
          SizedBox(height: 4),
          Text(
            des,
            textAlign: TextAlign.start,
            style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: ColorConstants.BLACK),
          ),
          SizedBox(height: 4),
          Text(
            price.toString(),
            style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorConstants.BLACK),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              RatingBar.readOnly(
                filledIcon: Icons.star,
                size: 14,
                emptyIcon: Icons.star_border,
                initialRating: ratings,
                maxRating: 5,
              ),
              Text(
                "( $ratingCount )",
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
