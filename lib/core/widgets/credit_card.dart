import 'package:ez_banking/core/utilities/screen_size_config.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth - 40,
      height: (SizeConfig.screenWidth - 40) / 1.68,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/worldmap.png'),
        ),
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
