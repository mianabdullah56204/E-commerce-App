import 'package:flutter/material.dart';

class AppData {
  static List<Map<String, dynamic>> categories = [
    {'image': "assets/court_2.png", "title": "Sneakers"},
    {'image': "assets/watch.png", "title": "Watch"},
    {'image': "assets/jacket.png", "title": "Jacket"},
  ];

  static List<Map<String, dynamic>> productList = [
    {
      'id': 1,
      'image': 'assets/court_1.png',
      'title': 'Nike Court Vision Low'.toUpperCase(),
      'category': 'Trending Now',
      'price': 240.00,
    },
    {
      'id': 2,
      'image': 'assets/air_1.png',
      'title': 'Nike Air Max 270'.toUpperCase(),
      'category': 'Best Selling',
      'price': 220.00,
    },
    {
      'id': 3,
      'image': 'assets/court_1.png',
      'title': 'Nike Court Vision Low'.toUpperCase(),
      'category': 'Trending Now',
      'price': 240.00,
    },
    {
      'id': 4,
      'image': 'assets/air_1.png',
      'title': 'Nike Air Max 270'.toUpperCase(),
      'category': 'Best Selling',
      'price': 220.00,
    },
  ];

  static List<String> showThumbnailList = [
    'assets/court_1.png',
    'assets/court_2.png',
    'assets/court_3.png',
    'assets/court_4.png',
    'assets/court_5.png',
  ];

  static List<int> sizes = [6, 7, 8, 9];

  static List<Color> colors = [
    Colors.brown,
    Colors.orange,
    Colors.blue,
    Colors.black,
    Colors.red,
    Colors.teal,
  ];

  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";

  static List<Map<String, dynamic>> cartItems = [
    {
      "title": "NIKE W AIR MAX 200",
      "price": 240.00,
      "image": "assets/court_1.png",
      "qty": 1,
    },
    {
      "title": "NIKE AIR MAX 97",
      "price": 190.00,
      "image": "assets/air_1.png",
      "qty": 1,
    },
    {
      "title": "NIKE AIR MAX 260",
      "price": 220.00,
      "image": "assets/court_1.png",
      "qty": 1,
    },
    {
      "title": "NIKE AIR MAX 260",
      "price": 220.00,
      "image": "assets/air_1.png",
      "qty": 1,
    },
  ];
}
