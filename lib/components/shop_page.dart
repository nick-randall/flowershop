import 'package:flowershop/components/productItem/product_item.dart';
import 'package:flowershop/components/shopDetails/shop_details.dart';
import 'package:flowershop/components/shopHeader/shop_header.dart';
import 'package:flowershop/components/shopHeader/shop_name_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product.dart';
import '../model/shop.dart';
import 'filterRow/filter_row.dart';

bool hasFilteredCategory(
    {required List<Filter> filters, required Product product}) {
  var has = false;
  for (final category in product.categories) {
    for (final filter in filters) {
      if (category == filter.name && filter.isActive) has = true;
    }
  }
  return has;
}

bool allFiltersOff(List<Filter> filters) => filters.every((e) => !e.isActive);

class ShopPage extends ConsumerWidget {
  const ShopPage(this.shop, {Key? key}) : super(key: key);

  final Shop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Filter> filters = ref.watch(filtersProvider);
    print(filters.every((e) => !e.isActive));

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
                    if (hasFilteredCategory(
                            filters: filters, product: product) ||
                        allFiltersOff(filters))
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ProductItem(
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
