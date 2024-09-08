import 'package:ez_banking/core/constants/colors.dart';
import 'package:ez_banking/core/pages/carousel/info_carousal_screen.dart';
import 'package:ez_banking/core/utilities/screen_size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "/splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Future.delayed(const Duration(seconds: 2),(){
      context.go(InfoCarouselScreen.route);
    });
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/logo.svg"),
            const SizedBox(
              height: 9,
            ),
            Text(
              "EZ Banking",
              style: GoogleFonts.poppins(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 80,
              child: LottieBuilder.asset('assets/lotties/loading_lottie.json'),
            ),
          ],
        ),
      ),
    );
  }
}
