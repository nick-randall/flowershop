import 'package:intl/intl.dart';

class Product {
  final String title;
  final String description;
  final List<String> categories;
  final double price;
  final double rating;
  final String image;
  final double? reducedFromPrice;
  bool isFavorite = false;

  Product(
      {required this.title,
      required this.description,
      required this.price,
      required this.categories,
      required this.rating,
      required this.image,
      this.reducedFromPrice});

  String get priceAsText =>
      NumberFormat.currency(locale: "eu", symbol: "€").format(price);

  String get reducedFromPriceAsText =>
      NumberFormat.currency(locale: "eu", symbol: "€").format(reducedFromPrice);

  static List<Product> sampleProducts = [
    Product(
        description: "Bouquet of roses and hibiscus",
        title: "Bouquet",
        price: 2.90,
        categories: ["Bouquet", "Popular"],
        image: "flower_1",
        rating: 4.5),
    Product(
        description: "Individual Rose",
        title: "Roses",
        price: 1.70,
        categories: ["Roses"],
        image: "flower_4",
        rating: 5.0),
    Product(
        description: "Bouquet of tulips",
        title: "Tulips",
        price: 3.70,
        categories: ["Bouquet", "Tulips"],
        image: "flower_1",
        rating: 3.5),
    Product(
        description: "Tulips in a pot",
        title: "Tulips",
        price: 4.35,
        reducedFromPrice: 3.95,
        categories: ["Tulips", "Popular"],
        image: "flower_1",
        rating: 4.0),
    Product(
        description: "Individual hibiscus",
        title: "Hibiscus",
        price: 1.25,
        reducedFromPrice: 0.95,
        categories: ["Popular"],
        image: "flower_1",
        rating: 3.5)
  ];
}
