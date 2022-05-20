import 'dart:math';

import 'package:flowershop/model/product.dart';
import 'package:flutter/material.dart';

class Shop {
  String name;
  OpeningHours openingHours;
  Address address;
  bool isFavorite = false;
  List<Product> products;

  Shop(
      {required this.openingHours,
      required this.name,
      required this.address,
      required this.products});

  static List<Shop> generateSampleShopData() {
    List<Shop> sampleShopData = [];
    for (int i = 0; i < 10; i++) {
      var dice = Random(1);
      var address = Address(street: "street", houseNumber: dice.nextInt(100));
      var products =
          List.generate(3, (index) => Product.sampleProducts[dice.nextInt(4)]);
      var name = "Name Flower-Shop";
      var openingHours = OpeningHours.standard(
          weekdayHours: DailyOpeningHours(const TimeOfDay(hour: 8, minute: 30),
              const TimeOfDay(hour: 20, minute: 0)),
          saturdayHours: DailyOpeningHours(const TimeOfDay(hour: 8, minute: 30),
              const TimeOfDay(hour: 20, minute: 0)));
      var newShop = Shop(
          address: address,
          name: name,
          products: products,
          openingHours: openingHours);
      sampleShopData.add(newShop);
    }
    return sampleShopData;
  }
}

class OpeningHours {
  DailyOpeningHours monday;
  DailyOpeningHours tuesday;
  DailyOpeningHours wednesday;
  DailyOpeningHours thursday;
  DailyOpeningHours friday;
  DailyOpeningHours saturday;
  DailyOpeningHours sunday;

  OpeningHours.standard(
      {required DailyOpeningHours weekdayHours,
      required DailyOpeningHours saturdayHours})
      : monday = weekdayHours,
        tuesday = weekdayHours,
        wednesday = weekdayHours,
        thursday = weekdayHours,
        friday = weekdayHours,
        saturday = saturdayHours,
        sunday = DailyOpeningHours.closed();
}

class DailyOpeningHours {
  TimeOfDay? start;
  TimeOfDay? finish;
  bool isOpen = true;

  DailyOpeningHours(this.start, this.finish);

  DailyOpeningHours.closed() {
    isOpen = false;
  }
}

class Address {
  String street;
  int houseNumber;

  Address({required this.street, required this.houseNumber});
  @override
  String toString() {
    return "$street $houseNumber";
  }
}
