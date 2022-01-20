import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String name = "cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Screen"),
      ),
    );
  }
}
