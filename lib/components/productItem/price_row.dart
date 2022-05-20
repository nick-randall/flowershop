import 'package:flowershop/constants/text_styles.dart';
import 'package:flutter/material.dart';
import '../../model/product.dart';

class PriceRow extends StatelessWidget {
  final Product product;

  const PriceRow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    if (product.reducedFromPrice == null) {
      return Text(product.priceAsText, style: normalPriceStyle);
    }
    return Row(
      children: [
        Text(product.priceAsText, style: salePriceStyle),
        const SizedBox(width: 4),
        Text(product.reducedFromPriceAsText, style: reducedFromPriceStyle)
      ],
    );
  }
}
