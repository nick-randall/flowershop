import 'package:flowershop/components/productItem/product_box.dart';
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
        body: Column(children: [
      const FilterRow(),
      Column(
          children: Product.sampleProducts
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ProductBox(
                      product: e,
                    ),
                  ))
              .toList()

          // const SizedBox(height: 8),

          ),
    ]));
  }
}
