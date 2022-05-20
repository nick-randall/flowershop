import 'package:flowershop/constants/colors.dart';
import 'package:flowershop/constants/text_styles.dart';
import 'package:flutter/material.dart';
import '../../model/shop.dart';

class ShopDetails extends StatelessWidget {
  final Shop shop;

  const ShopDetails({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: shopHeaderBackgroundColor,
          child: Row(children: [
            const SizedBox(width: 16),
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Image.asset('./images/shop_logo.png'),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                Text(
                    'Opening hours: ${shop.openingHours.friday.getOpeningHoursAsString(context)}',
                    style: openingHoursStyle),
                const SizedBox(height: 4),
                Text(shop.address.toString(), style: shopAddressStyle),
                const SizedBox(height: 8),
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 5),
                    child: const Text('Supermarkt', style: shopAddressStyle)),
                const SizedBox(height: 27),
              ],
            ),
            // Background picture asset comes here
            const SizedBox(
              width: 150,
            )
          ]),
        ),
        // ShopDetailsBoxes(shop: shop)
      ],
    );
  }
}
