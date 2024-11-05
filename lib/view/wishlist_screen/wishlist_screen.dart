import 'package:ecommerce_clone_july/dummy_db.dart';
import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:ecommerce_clone_july/utils/image_constants.dart';
import 'package:ecommerce_clone_july/view/global_widgets/custom_textfield_with_shadow.dart';
import 'package:ecommerce_clone_july/view/wishlist_screen/widgets/wishlits_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            child: Icon(
              Icons.menu,
              size: 24,
            ),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              ImageConstants.MYAPPLOGO,
              height: 31,
              width: 38,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 9),
            Text("Stylish",
                style: GoogleFonts.libreCaslonText(
                    color: ColorConstants.SECONDARY,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          CircleAvatar(radius: 20),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),

            //seciton 1 - search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextFieldWithShadow(),
            ),
            // section 2 - filter section
            SizedBox(height: 16),

            _builFilterSection(),
            SizedBox(height: 16),

            _buildProductSection()
          ],
        ),
      ),
    );
  }

  Widget _buildProductSection() {
    return MasonryGridView.builder(
      itemCount: DummyDb.wishlistItems.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => WishlistItemCard(
        imageUrl: DummyDb.wishlistItems[index]["imageUrl"],
        des: DummyDb.wishlistItems[index]["des"],
        price: DummyDb.wishlistItems[index]["rate"],
        ratingCount: DummyDb.wishlistItems[index]["rating_count"],
        ratings: DummyDb.wishlistItems[index]["rating"],
        title: DummyDb.wishlistItems[index]["title"],
      ),
    );
  }

  Widget _builFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        children: [
          Text(
            "52,082+ Iteams ",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: ColorConstants.WHITE,
                borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text(
                  "sort",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.swap_vert,
                  size: 16,
                )
              ],
            ),
          ),
          SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
                color: ColorConstants.WHITE,
                borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Text("Filter",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    )),
                Icon(
                  Icons.filter_alt_outlined,
                  size: 16,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
