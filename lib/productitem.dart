// this class makes the display of each item in the grid view of the products
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double price;

  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Theme.of(context).colorScheme.primary,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Flexible(
          child: Text(
            productName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: Text(
            '\$${price.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 14),
            overflow:
                TextOverflow.ellipsis, // Add this line to handle long prices
          ),
        ),
      ],
    );
  }
}
