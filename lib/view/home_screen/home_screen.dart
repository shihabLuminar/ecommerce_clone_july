import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:ecommerce_clone_july/dummy_db.dart';
import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:ecommerce_clone_july/utils/image_constants.dart';
import 'package:ecommerce_clone_july/view/global_widgets/custom_textfield_with_shadow.dart';
import 'package:ecommerce_clone_july/view/home_screen/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            SizedBox(height: 16),
            // seciton 2 - All featured section
            _buildAllFeaturedSection(),
            // seciton - 3 - carrousel seciton
            SizedBox(height: 16),
            // section 4
            _buildCarouselSection(),

            SizedBox(height: 16),
            // section 5
            _builDealOfTheDaySection(),
          ],
        ),
      ),
    );
  }

  Widget _builDealOfTheDaySection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: EdgeInsets.only(right: 12, left: 8, top: 8, bottom: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorConstants.SECONDARY),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deal of the Day",
                      style: GoogleFonts.montserrat(
                          color: ColorConstants.WHITE,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.alarm, color: ColorConstants.WHITE),
                        SizedBox(width: 5.5),
                        Text(
                          "22h 55m 20s remaining ",
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
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              7,
              (index) => CustomItemCard(),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCarouselSection() {
    final controller = PageController(viewportFraction: 0.8, keepPage: true);

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: DummyDb.featuredItemsList.length,
          options: CarouselOptions(
            height: 189,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.easeIn,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, index, realIndex) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          DummyDb.featuredItemsList[index]["imageUrl"])),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(index.toString()),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SmoothPageIndicator(
            controller: PageController(initialPage: 1),
            count: 3,
            effect: ScrollingDotsEffect(
              activeDotScale: 1.4,
              maxVisibleDots: 5,
              radius: 10,
              spacing: 8,
              dotHeight: 9,
              dotWidth: 9,
            )),
      ],
    );
  }

  Column _buildAllFeaturedSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(
            children: [
              Text(
                "All Featured",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: ColorConstants.PRIMARY,
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
                    color: ColorConstants.PRIMARY,
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
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              DummyDb.featuredItemsList.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                          DummyDb.featuredItemsList[index]["imageUrl"]),
                    ),
                    SizedBox(height: 4),
                    Text(DummyDb.featuredItemsList[index]["name"]),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
