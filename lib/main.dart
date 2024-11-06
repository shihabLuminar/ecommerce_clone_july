import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:ecommerce_clone_july/view/product_details_screen/product_detials_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConstants.SCAFFOLDBG,
      ),
      debugShowCheckedModeBanner: false,
      home: ProductDetialsScreen(),
    );
  }
}
