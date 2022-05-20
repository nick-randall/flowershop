import 'package:flowershop/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopNameRow extends StatelessWidget {
  final String name;

  const ShopNameRow({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Text(name, style: shopNameStyle)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SvgPicture.asset('./images/back_button.svg')),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(children: [
                SvgPicture.asset('./images/magnifying_glass.svg'),
                const SizedBox(width: 12.43),
                Image.asset('images/other_heart.png')
              ]),
            )
          ],
        ),
      ],
    );
  }
}
