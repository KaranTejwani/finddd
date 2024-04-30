import 'package:classico/checkout.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map<String, dynamic>> cartItems = [
    {
      "pid": "222",
      "pname": "Plant",
      "size": "L",
      "price": 6000.0,
      "quantity": 2,
      "imageurl": "assets/images/plant.jpg"
    },
    {
      "pid": "223",
      "pname": "Cold drink",
      "size": "1 litre",
      "price": 1500.0,
      "quantity": 3,
      "imageurl": "assets/images/pepsi.jpg"
    },
    {
      "pid": "224",
      "pname": "Sneakers",
      "size": "S",
      "price": 5000.0,
      "quantity": 1,
      "imageurl": "assets/images/shoe.jpg"
    },
  ];
  double finalTotal = 0.0;
  List<Map<String, dynamic>> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                "Total: ${finalTotal.toStringAsFixed(2)} Rs",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                var item = cartItems[index];
                return Dismissible(
                  key: Key(item["pid"]),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      cartItems.removeAt(index);
                    });
                  },
                  child: CartEntity(
                    item: item,
                    isSelected: selectedItems.contains(item),
                    onChanged: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedItems.add(item);
                        } else {
                          selectedItems.remove(item);
                        }
                        updateTotal();
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Checkout()),
          );
        },
        label: const Text(
          "Checkout",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void updateTotal() {
    finalTotal = 0.0;
    for (var item in selectedItems) {
      finalTotal += item["price"] * item["quantity"];
    }
  }
}

class CartEntity extends StatefulWidget {
  final Map<String, dynamic> item;
  final bool isSelected;
  final ValueSetter<bool>? onChanged;

  const CartEntity({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CartEntityState createState() => _CartEntityState();
}

class _CartEntityState extends State<CartEntity> {
  late int _quantity;
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _quantity = widget.item["quantity"];
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: const Color.fromRGBO(
                128, 128, 128, 0.5), // Replace with desired color value
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: _isSelected,
            onChanged: (bool? value) {
              setState(() {
                _isSelected = value ?? false;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(_isSelected);
              }
            },
          ),
          const SizedBox(width: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              widget.item["imageurl"],
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item["pname"],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  "Size: ${widget.item["size"]}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  "Price: ${widget.item["price"]} Rs",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 2.0),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        // Decrease quantity
                        if (_quantity > 1) {
                          setState(() {
                            _quantity--;
                          });
                          widget.item["quantity"] = _quantity;
                        }
                      },
                    ),
                    Text(
                      "Quantity: $_quantity",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        // Increase quantity
                        setState(() {
                          _quantity++;
                        });
                        widget.item["quantity"] = _quantity;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
