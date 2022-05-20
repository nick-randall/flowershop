import 'package:flowershop/constants/colors.dart';
import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 18,
          height: 2.1,
          decoration: const BoxDecoration(
              color: mainTextColor,
              borderRadius: BorderRadius.all(Radius.circular(16))),
        ),
        const SizedBox(height: 4.3),
        Container(
          width: 18,
          height: 2.1,
          decoration: const BoxDecoration(
              color: mainTextColor,
              borderRadius: BorderRadius.all(Radius.circular(16))),
        ),
        const SizedBox(height: 4.3),
        Container(
          width: 18,
          height: 2.1,
          decoration: const BoxDecoration(
              color: mainTextColor,
              borderRadius: BorderRadius.all(Radius.circular(16))),
        )
      ],
    );
  }
}
