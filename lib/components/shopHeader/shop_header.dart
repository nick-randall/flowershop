import 'package:flowershop/components/shopHeader/shop_name_row.dart';
import 'package:flowershop/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShopHeader extends StatelessWidget {
  final String name;

  const ShopHeader({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      color: shopHeaderBackgroundColor,
      child: Column(
          children: [const SizedBox(height: 56), ShopNameRow(name: name)]),
    );
  }
}
