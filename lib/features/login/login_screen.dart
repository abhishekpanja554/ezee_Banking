import 'package:ez_banking/core/constants/colors.dart';
import 'package:ez_banking/core/pages/home/home_screen.dart';
import 'package:ez_banking/core/widgets/blue_button.dart';
import 'package:ez_banking/core/widgets/input_textfield.dart';
import 'package:ez_banking/core/widgets/round_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundBackButton(
                      onTap: () {
                        context.pop();
                      },
                    ),
                    const SizedBox(),
                  ],
                ),
                const SizedBox(
                  height: 53,
                ),
                Text(
                  'Sign In',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 53,
                ),
                const InputTextFormField(
                  label: 'Email Address',
                  hint: 'Enter Email Address',
                  keyboardType: TextInputType.emailAddress,
                  icon: CupertinoIcons.envelope,
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputTextFormField(
                  label: 'Password',
                  hint: 'Enter Password',
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  icon: CupertinoIcons.lock,
                ),
                const SizedBox(
                  height: 40,
                ),
                Hero(
                  tag: 'btn',
                  child: BlueButton(
                    title: 'Sign In',
                    onPressed: () {
                      context.go(HomeScreen.route);
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I'm a new user. ",
                      style: GoogleFonts.poppins(
                        color: textGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          color: brightBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
