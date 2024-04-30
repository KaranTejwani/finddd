import 'package:classico/imageslider.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<String> images = [
    'assets/images/shoe.jpg',
    'assets/images/shoe2.png',
    'assets/images/shoe3.jpg'
  ];
  List<Map<String, String>> reviews = [
    {'userName': 'John Doe', 'review': 'Great product! Fits perfectly.'},
    {'userName': 'Jane Smith', 'review': 'Good quality shoes.'},
    {'userName': 'Anonymous', 'review': 'Fast delivery.'},
  ];
  int currentIndex = 0;
  String productName = "Nike Sports Shoes";
  double price = 6000;
  Widget description() {
    return Text("This is one of the product by NIKE");
  }

  Widget sizefit() {
    return Text("This is the size and fit of the product");
  }

  Widget returnpolicy() {
    return Text(
        "You can easily return or refund your products by sending the reason why you want to return or exchange the product and in case of any problem you can send us the images of the product.");
  }

  int quantity = 0;
  bool smallSelected = false;
  bool mediumSelected = false;
  bool largeSelected = false;

  void onadd() {
    setState(() {
      quantity++;
    });
  }

  void onsub() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: onsub,
              icon: const Icon(Icons.remove),
            ),
            Text(quantity.toString()),
            IconButton(
              onPressed: onadd,
              icon: const Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: theme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Add To Cart'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              child: ImageSliderBuilder(
                imageUrls: images,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Rs. $price',
                    style: TextStyle(
                      fontSize: 18,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Size:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          _buildSizeButton('S'),
                          const SizedBox(width: 10),
                          _buildSizeButton('M'),
                          const SizedBox(width: 10),
                          _buildSizeButton('L'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildExpansionTile('Description', description),
                  const SizedBox(height: 20),
                  _buildExpansionTile('Size & Fit', sizefit),
                  const SizedBox(height: 20),
                  _buildExpansionTile('Delivery & Return', returnpolicy),
                  const SizedBox(height: 20),
                  _buildExpansionTile(
                      'Reviews', () => buildReviewList(reviews)),
                  const SizedBox(height: 20),
                  // _buildReviewItem(
                  //     'John Doe', 'Great product! Fits perfectly.'),
                  // _buildReviewItem('Jane Smith', 'Good quality shoes.'),
                  // _buildReviewItem('Anonymous', 'Fast delivery.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    bool selected = false;
    if (size == 'S') {
      selected = smallSelected;
    } else if (size == 'M') {
      selected = mediumSelected;
    } else if (size == 'L') {
      selected = largeSelected;
    }

    return OutlinedButton(
      onPressed: () {
        setState(() {
          smallSelected = size == 'S';
          mediumSelected = size == 'M';
          largeSelected = size == 'L';
        });
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 20),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          selected ? Theme.of(context).colorScheme.primary : Colors.transparent,
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          fontSize: 16,
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildExpansionTile(String title, dynamic content) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: content is String
              ? Text(
                  content,
                  style: const TextStyle(fontSize: 16),
                )
              : content(),
        ),
      ],
    );
  }

  Widget _buildReviewItem(String userName, String review) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            review,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget buildReviewList(List<Map<String, String>> reviews) {
    return ListView.builder(
      itemCount: reviews.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[100],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviews[index]['userName'] ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  reviews[index]['review'] ?? '',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
