import 'package:flowershop/components/star_rating_bar.dart';
import 'package:flowershop/components/heart_button.dart';
import 'package:flowershop/components/price_row.dart';
import 'package:flowershop/constants/text_styles.dart';
import 'package:flowershop/model/product.dart';
import 'package:flowershop/model/shop.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Shop.generateSampleShopData();
    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: backgroundColor),
          borderRadius: BorderRadius.circular(12)),
      height: 164,
      child: Stack(children: [
        Row(
          children: [
            Container(
                width: 164,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  color: backgroundColor,
                ),
                child: Image.asset("./images/${product.image}.png")),
            // This Flexible allows Container to take up its whole size, which
            // gives it an auto-width and causes the text to auto-wrap
            Container(
              padding: const EdgeInsets.only(
                  top: 14, bottom: 14, left: 12, right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title, style: productTitleStyle),
                      const SizedBox(height: 4),
                      SizedBox(
                          width: 155,
                          child: Text(product.description,
                              style: productDescriptionStyle)),
                      const SizedBox(height: 8.67),
                      StarRatingBar(product.rating),
                    ],
                  ),
                  PriceRow(product: product),
                ],
              ),
            ),
          ],
        ),
        const Positioned(
            top: 9.09,
            right: 8.9,
            // left: 319.29,
            // bottom: 141.09,
            child: HeartButton()),
        Positioned(
            bottom: 8,
            right: 8,
            child: SvgPicture.asset('./images/shopping_cart.svg')),
      ]),
    );
  }
}
