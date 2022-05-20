import 'package:flowershop/components/productItem/product_box.dart';
import 'package:flowershop/components/shopDetails/shop_details.dart';
import 'package:flowershop/components/shopHeader/shop_header.dart';
import 'package:flowershop/components/shopHeader/shop_name_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product.dart';
import '../model/shop.dart';
import 'filterRow/filter_row.dart';

class ShopPage extends ConsumerWidget {
  const ShopPage(this.shop, {Key? key}) : super(key: key);

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(top: 88, child: ShopDetails(shop: shop)),
        SingleChildScrollView(
          controller: ScrollController(
              initialScrollOffset: 88.0, keepScrollOffset: true),
          child: Column(
            children: [
              const SizedBox(height: 200),
              Container(
                color: Colors.white,
                child: Column(children: [
                  const FilterRow(),
                  for (final product in shop.products)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ProductBox(
                        product: product,
                      ),
                    )
                ]),
              ),
            ],
          ),
        ),
        ShopHeader(name: shop.name),
      ],
    ));
  }
}
