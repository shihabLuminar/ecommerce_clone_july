import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:ecommerce_clone_july/dummy_db.dart';
import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:ecommerce_clone_july/utils/image_constants.dart';
import 'package:ecommerce_clone_july/view/global_widgets/custom_textfield_with_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Column(
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

          _buildCarouselSection(),
          TimerCountdown(
            enableDescriptions: false,
            format: CountDownTimerFormat.daysHoursMinutesSeconds,
            endTime: DateTime.now().add(
              Duration(
                days: 5,
                hours: 14,
                minutes: 27,
                seconds: 34,
              ),
            ),
            onEnd: () {
              print("Timer finished");
            },
          )
        ],
      ),
    );
  }

  CarouselSlider _buildCarouselSection() {
    return CarouselSlider.builder(
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
