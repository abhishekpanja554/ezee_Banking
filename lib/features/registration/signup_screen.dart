import 'package:ez_banking/core/constants/colors.dart';
import 'package:ez_banking/core/widgets/blue_button.dart';
import 'package:ez_banking/core/widgets/input_textfield.dart';
import 'package:ez_banking/core/widgets/round_back_button.dart';
import 'package:ez_banking/features/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  static const String route = "/signup";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                  'Sign Up',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 53,
                ),
                const InputTextFormField(
                  label: 'Full Name',
                  hint: 'Enter Full Name',
                  keyboardType: TextInputType.name,
                  icon: CupertinoIcons.person,
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputTextFormField(
                  label: 'Phone Number',
                  hint: 'Enter Phone Number',
                  keyboardType: TextInputType.phone,
                  icon: CupertinoIcons.phone,
                ),
                const SizedBox(
                  height: 20,
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
                    title: 'Sign Up',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account. ",
                      style: GoogleFonts.poppins(
                        color: textGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        context.push(LoginScreen.route);
                      },
                      child: Text(
                        "Sign In",
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
