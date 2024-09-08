import 'package:ez_banking/core/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundBackButton extends StatelessWidget {
  final Function() onTap;
  const RoundBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(backgroundColor: blueGrey),
      splashRadius: 21,
      onPressed: onTap,
      icon: const Padding(
        padding: EdgeInsets.only(right: 3),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
