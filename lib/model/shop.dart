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

  static Shop sampleShop = Shop(
      openingHours: OpeningHours.standard(
          weekdayHours: DailyOpeningHours(const TimeOfDay(hour: 8, minute: 30),
              const TimeOfDay(hour: 20, minute: 0)),
          saturdayHours: DailyOpeningHours(
            const TimeOfDay(hour: 8, minute: 30),
            const TimeOfDay(hour: 20, minute: 0),
          )),
      name: "Flowery Shop",
      address: Address(street: "Bundesstr.", houseNumber: 45),
      products: Product.sampleProducts);
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
  @override
  String getOpeningHoursAsString(BuildContext context) {
    // TODO: implement toString
    return "${start!.format(context)}-${finish!.format(context)}";
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
