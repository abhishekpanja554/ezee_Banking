import 'package:ez_banking/core/constants/colors.dart';
import 'package:ez_banking/core/widgets/credit_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget homePageHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: iconGrey,
          radius: 25,
          child: const Icon(
            CupertinoIcons.person_alt,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome,',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: textGrey,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Abhishek Panja',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Expanded(
          child: SizedBox(),
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(30),
          radius: 30,
          child: CircleAvatar(
            backgroundColor: blueGrey,
            radius: 21,
            child: const Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              homePageHeader(),
              const SizedBox(
                height: 30,
              ),
              const CreditCard(),
            ],
          ),
        ),
      ),
    );
  }
}
