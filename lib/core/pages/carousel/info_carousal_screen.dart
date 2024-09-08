// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ez_banking/core/widgets/blue_button.dart';
import 'package:ez_banking/features/registration/signup_screen.dart';
import 'package:flutter/material.dart';

import 'package:ez_banking/core/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCarouselScreen extends StatefulWidget {
  static const String route = "/info_carousel";
  const InfoCarouselScreen({super.key});

  @override
  State<InfoCarouselScreen> createState() => _InfoCarouselScreenState();
}

class _InfoCarouselScreenState extends State<InfoCarouselScreen> {
  int currentCarouselIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  List<CarouselItem> carouselItems = [
    CarouselItem(
      image: "assets/carousel_img_1.svg",
      title: "Fastest Payment in the world",
      subTitle:
          "Integrate multiple payment methoods to help you up the process quickly",
    ),
    CarouselItem(
      image: "assets/carousel_img_2.svg",
      title: "The most Secoure Platfrom for Customer",
      subTitle:
          "Built-in Fingerprint, face recognition and more, keeping you completely safe",
    ),
    CarouselItem(
      image: "assets/carousel_img_3.svg",
      title: "Paying for Everything is Easy and Convenient",
      subTitle:
          "Built-in Fingerprint, face recognition and more, keeping you completely safe",
    ),
  ];

  Widget carouselBuilder() {
    return CarouselSlider.builder(
      carouselController: _controller,
      itemCount: carouselItems.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          SizedBox(
        child: SvgPicture.asset(
          carouselItems[itemIndex].image,
        ),
      ),
      options: CarouselOptions(
        height: 300,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.5,
        onPageChanged: (int index, b) {
          setState(() {
            currentCarouselIndex = index;
          });
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget carouselIndicatorBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: carouselItems.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: currentCarouselIndex == entry.key ? 20 : 6,
            height: 6,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: currentCarouselIndex == entry.key ? brightBlue : iconGrey,
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          carouselBuilder(),
          const SizedBox(
            height: 10,
          ),
          carouselIndicatorBuilder(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 0.5),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: Column(
                key:
                    ValueKey<String>(carouselItems[currentCarouselIndex].title),
                children: [
                  Text(
                    carouselItems[currentCarouselIndex].title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    carouselItems[currentCarouselIndex].subTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 2, child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Hero(
              tag: 'btn',
              child: BlueButton(
                title: "Next",
                onPressed: () {
                  context.push(SignInScreen.route);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}

class CarouselItem {
  String image;
  String title;
  String subTitle;
  CarouselItem(
      {required this.image, required this.title, required this.subTitle});
}
