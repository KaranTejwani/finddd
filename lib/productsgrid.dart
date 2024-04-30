import 'package:classico/productitem.dart';
import 'package:classico/productsdetails.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key, required this.products}) : super(key: key);

  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductDetailPage()),
              );
            },
            child: ProductItem(
              imageUrl: products[index]['imageURL'] as String,
              productName: products[index]['name'] as String,
              price: products[index]['price'] as double,
            ),
          );
        },
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 160,
          childAspectRatio: 0.7,
          crossAxisSpacing: 0, // Adjusted to 0
          mainAxisSpacing: 8,
        ),
      ),
    );
  }
}
