import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:ecommerce_clone_july/utils/image_constants.dart';
import 'package:ecommerce_clone_july/view/global_widgets/custom_textfield_with_shadow.dart';
import 'package:flutter/material.dart';
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
          //seciton 1 - search field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFieldWithShadow(),
          ),

          // seciton 2 - All featured section
          _buildAllFeaturedSection()
          // seciton - 3 - carrousel seciton
        ],
      ),
    );
  }

  Column _buildAllFeaturedSection() {
    return Column(
      children: [
        Row(
          children: [
            Text("All Featured"),
            Spacer(),
            Container(
              child: Row(
                children: [Text("sort"), Icon(Icons.swap_vert)],
              ),
            ),
            Container(
              child: Row(
                children: [Text("Filter"), Icon(Icons.filter_alt_outlined)],
              ),
            )
          ],
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => Column(
                children: [
                  CircleAvatar(
                    radius: 28,
                  ),
                  SizedBox(height: 4),
                  Text("All Featured"),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
