import 'package:intl/intl.dart';

class Product {
  final String name;
  final String subtitle;
  final List<String> categories;
  final double price;
  final double rating;
  final String image;
  final double? salesPrice;
  bool isFavorite = false;

  Product(
      {required this.name,
      required this.subtitle,
      required this.price,
      required this.categories,
      required this.rating,
      required this.image,
      this.salesPrice});

  String get priceAsText => NumberFormat.currency(locale: "eu", symbol: "€")
      .format(price); //"${price.toStringAsFixed(2)}€";

  String get salesPriceAsText =>
      NumberFormat.currency(locale: "eu", symbol: "€").format(salesPrice);

  static List<Product> sampleProducts = [
    Product(
        name: "Bouquet of roses and hibiscus",
        subtitle: "Bouquet",
        price: 2.90,
        categories: ["Bouquet", "Popular"],
        image: "flower_1",
        rating: 4.5),
    Product(
        name: "Individual Rose",
        subtitle: "Roses",
        price: 1.70,
        categories: ["Roses"],
        image: "flower_4",
        rating: 5.0),
    Product(
        name: "Bouquet of tulips",
        subtitle: "Tulips",
        price: 3.70,
        categories: ["Bouquet", "Tulips"],
        image: "flower_1",
        rating: 3.5),
    Product(
        name: "Tulips in a pot",
        subtitle: "Tulips",
        price: 4.35,
        salesPrice: 3.95,
        categories: ["Tulips", "Popular"],
        image: "flower_1",
        rating: 4.0),
    Product(
        name: "Individual hibiscus",
        subtitle: "Hibiscus",
        price: 1.25,
        salesPrice: 0.95,
        categories: ["Popular"],
        image: "flower_1",
        rating: 3.5)
  ];
}
