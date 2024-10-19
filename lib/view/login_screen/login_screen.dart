import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:ecommerce_clone_july/view/global_widgets/custom_button.dart';
import 'package:ecommerce_clone_july/view/global_widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19.0, horizontal: 26),
          child: Column(
            children: [
              Text(
                "Welcome Back!",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: ColorConstants.BLACK),
              ),
              SizedBox(height: 36),
              CustomInputField(
                hintTex: "Username or Email",
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 31),
              CustomInputField(
                hintTex: "Password",
                prefixIcon: Icons.lock,
              ),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot password"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
