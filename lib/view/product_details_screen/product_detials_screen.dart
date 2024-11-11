import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:ecommerce_clone_july/view/product_details_screen/widget/custom_icon_card.dart';
import 'package:ecommerce_clone_july/view/product_details_screen/widget/custom_textfield_with_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetialsScreen extends StatefulWidget {
  const ProductDetialsScreen({super.key});

  @override
  State<ProductDetialsScreen> createState() => _ProductDetialsScreenState();
}

class _ProductDetialsScreenState extends State<ProductDetialsScreen> {
  final imageController = PageController();
  int clickedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_left)),
        actions: [
          CircleAvatar(
            child: Icon(Icons.shopping_cart_rounded),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(),

            // section 2 - size section
            SizedBox(
              height: 16,
            ),
            _buildSizeSection(),
            SizedBox(height: 30),
            Row(
              children: [
                CustomIconCard(
                  text: "Go to Cart",
                  icon: Icons.shopping_cart_outlined,
                  color1: Color(0xff3F92FF),
                  color2: Color(0xff0B3689),
                ),
                SizedBox(width: 12),
                CustomIconCard(
                  text: "Buy Now",
                  icon: Icons.touch_app,
                  color1: Color(0xff71F9A9),
                  color2: Color(0xff31B769),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  CustomTextfieldWithTitle(
                    title: "name",
                    hintText: "enter",
                    keyboardType: TextInputType.name,
                  ),
                  CustomTextfieldWithTitle(
                    title: "password",
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    validator: (value) {
                      print(value);
                    },
                    suffixIcon: Icon(Icons.password),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildSizeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("Size: 7UK"),
        ),
        SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: List.generate(
                10,
                (index) => Padding(
                  padding: EdgeInsets.only(right: index == 9 ? 0 : 10),
                  child: InkWell(
                    onTap: () {
                      clickedIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: clickedIndex == index
                              ? ColorConstants.PRIMARY
                              : ColorConstants.WHITE,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              width: 1.5, color: ColorConstants.PRIMARY)),
                      child: Text(
                        "${index + 1} UK",
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: clickedIndex == index
                                ? ColorConstants.WHITE
                                : ColorConstants.PRIMARY),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Column _buildImageSection() {
    return Column(
      children: [
        SizedBox(
            height: 235,
            child: Stack(
              children: [
                PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  controller: imageController,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/28748671/pexels-photo-28748671/free-photo-of-scenic-beach-view-with-umbrellas-in-vietnam.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 28,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {
                      imageController.nextPage(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.linear);
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorConstants.GREYSHDE1.withOpacity(.5),
                      child: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 28,
                  child: InkWell(
                    onTap: () {
                      imageController.previousPage(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.ease);
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorConstants.GREYSHDE1.withOpacity(.5),
                      child: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),
                ),
              ],
            )),
        SizedBox(
          height: 12,
        ),
        SmoothPageIndicator(
            controller: imageController,
            count: 10,
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
}
