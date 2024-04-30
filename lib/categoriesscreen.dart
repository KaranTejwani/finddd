import 'package:classico/imageslider.dart';
import 'package:classico/categoryboxes.dart';
import 'package:classico/productsgrid.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
        children: [
          const SizedBox(height: 10), // Add spacing
          const ImageSliderBuilder(
            imageUrls: [
              'assets/images/shoes.jpg',
              'assets/images/sale.jpg',
              'assets/images/arrival2.jpg'
            ],
          ),
          const SizedBox(height: 10), // Add spacing
          const CategoryBoxes(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductsScreen extends StatelessWidget {
  final String category;
  ProductsScreen({Key? key, required this.category}) : super(key: key);

  var products = [
    {
      'name': 'Athletic shoes',
      'imageURL': 'assets/images/shoe.jpg',
      'price': 200.0
    },
    {
      'name': 'Handsfree',
      'imageURL': 'assets/images/handsfree.jpg',
      'price': 150.0
    },
    {
      'name': 'Eyeliner',
      'imageURL': 'assets/images/eyeliner.jpg',
      'price': 100.0
    },
    {'name': 'Tomatoes', 'imageURL': 'assets/images/tomato.jpg', 'price': 50.0},
    {'name': 'Pepsi', 'imageURL': 'assets/images/pepsi.jpg', 'price': 20.0},
    {'name': 'Toy Car', 'imageURL': 'assets/images/toy.jpg', 'price': 12.0},
    {'name': 'Plant', 'imageURL': 'assets/images/plant.jpg', 'price': 5.0},
    {
      'name': 'Sun Glasses',
      'imageURL': 'assets/images/glasses.jpg',
      'price': 30.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            category,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: ProductGrid(products: products));
  }
}
