import 'package:flutter/material.dart';

class SavedItemsScreen extends StatelessWidget {
  const SavedItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Items"),
      ),
      body: Center(
        child: Text("Saved Items Screen"),
      ),
    );
  }
}
