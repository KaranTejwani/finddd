import 'package:classico/addproductscreen.dart';
import 'package:classico/inventoryscreen.dart';
import 'package:classico/ordermanagement.dart';
import 'package:classico/seller.dart';
import 'package:flutter/material.dart';

class SellerDashboardScreen extends StatelessWidget {
  final Seller seller = Seller(
    shop_name: 'Habib Nihari Store',
    imageUrl: 'assets/images/person1.jpg',
    type: 'Hotel',
    city: 'Sukkur',
    contact_no: '03001234567',
    seller: 'Usama',
  );

  SellerDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Seller profile section
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/person1.jpg'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      seller.seller, // Replace with seller's name
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        'Seller ID: 12345'), // Replace with actual seller ID
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Seller actions
            ElevatedButton(
              onPressed: () {
                // Navigate to add product screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddProductScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
              child: const Text('Add New Product'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to order management screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrdersScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
              child: const Text('View Orders'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to inventory management screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InventoryManagementScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
              child: const Text('Manage Inventory'),
            ),

            // Other seller-related widgets (e.g., sales performance charts, notifications)
            // ...
          ],
        ),
      ),
    );
  }
}
