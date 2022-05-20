import 'package:flowershop/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../model/shop.dart';

class ShopDetailsBoxes extends StatelessWidget {
  final Shop shop;

  const ShopDetailsBoxes({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Container(
              height: 94,
              width: 164,
              decoration: BoxDecoration(
                  border: Border.all(color: detailsBoxBackgroundColor),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
            ),
            const SizedBox(width: 15),
            Container(
              height: 94,
              width: 164,
              decoration: BoxDecoration(
                  border: Border.all(color: detailsBoxBackgroundColor),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
            ),
            const SizedBox(width: 16),
          ],
        )
      ]),
    );
  }
}
