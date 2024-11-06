import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetialsScreen extends StatefulWidget {
  const ProductDetialsScreen({super.key});

  @override
  State<ProductDetialsScreen> createState() => _ProductDetialsScreenState();
}

class _ProductDetialsScreenState extends State<ProductDetialsScreen> {
  final imageController = PageController();
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
      body: Column(
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
                        backgroundColor:
                            ColorConstants.GREYSHDE1.withOpacity(.5),
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
                        backgroundColor:
                            ColorConstants.GREYSHDE1.withOpacity(.5),
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
      ),
    );
  }
}
