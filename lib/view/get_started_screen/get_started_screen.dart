import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:ecommerce_clone_july/utils/image_constants.dart';
import 'package:ecommerce_clone_july/view/global_widgets/custom_button.dart';
import 'package:ecommerce_clone_july/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ImageConstants.GETSTARTEDBG))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 70, bottom: 34, left: 37, right: 37),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    ColorConstants.BLACK.withOpacity(0),
                    ColorConstants.BLACK.withOpacity(.6),
                    ColorConstants.BLACK.withOpacity(.7),
                    ColorConstants.BLACK.withOpacity(1),
                  ])),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "You want Authentic, here you go!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        color: ColorConstants.WHITE,
                        fontSize: 34,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "You want Authentic, here you go!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: ColorConstants.WHITE,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 44),
                  CustomButton(
                    buttonText: "Get Started",
                    onButtonPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    },
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
