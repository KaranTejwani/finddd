import 'package:flutter/material.dart';

class InventoryManagementScreen extends StatefulWidget {
  const InventoryManagementScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InventoryManagementScreenState createState() =>
      _InventoryManagementScreenState();
}

class _InventoryManagementScreenState extends State<InventoryManagementScreen> {
  // Dummy list of products in inventory (replace this with actual data)
  List<Product> products = [
    Product(
      productName: 'Product A',
      quantity: 10,
      price: 50.0,
    ),
    Product(
      productName: 'Product B',
      quantity: 5,
      price: 100.0,
    ),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildProductCard(products[index], theme);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewProduct(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: theme.primaryColor, // Primary color from theme
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  Widget _buildProductCard(Product product, ThemeData theme) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.productName,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Quantity: ${product.quantity}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _editProduct(context, product, theme);
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(
                        color: theme.primaryColor), // Primary color from theme
                  ),
                ),
                const SizedBox(width: 8.0),
                TextButton(
                  onPressed: () {
                    _deleteProduct(context, product, theme);
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        color: theme.errorColor), // Error color from theme
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addNewProduct(BuildContext context) {
    // Add functionality to add a new product
  }

  void _editProduct(BuildContext context, Product product, ThemeData theme) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Allows the bottom sheet to scroll above the keyboard
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    labelStyle: TextStyle(
                        color: theme.primaryColor), // Primary color from theme
                  ),
                  controller: TextEditingController(text: product.productName),
                  onChanged: (value) {
                    product.productName = value;
                  },
                ),
                const SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    labelStyle: TextStyle(
                        color: theme.primaryColor), // Primary color from theme
                  ),
                  keyboardType: TextInputType.number,
                  controller:
                      TextEditingController(text: product.quantity.toString()),
                  onChanged: (value) {
                    product.quantity = int.tryParse(value) ?? 0;
                  },
                ),
                const SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    labelStyle: TextStyle(
                        color: theme.primaryColor), // Primary color from theme
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller:
                      TextEditingController(text: product.price.toString()),
                  onChanged: (value) {
                    product.price = double.tryParse(value) ?? 0.0;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the bottom sheet
                    // Add functionality to save changes to the product
                  },
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .primary, // Primary color from theme
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _deleteProduct(BuildContext context, Product product, ThemeData theme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Product'),
          content:
              Text('Are you sure you want to delete ${product.productName}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add functionality to delete the product
                Navigator.of(context).pop();
              },
              child: Text(
                'Delete',
                style: TextStyle(
                    color: theme.errorColor), // Error color from theme
              ),
            ),
          ],
        );
      },
    );
  }
}

class Product {
  String productName;
  int quantity;
  double price;

  Product({
    required this.productName,
    required this.quantity,
    required this.price,
  });
}
