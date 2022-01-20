import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/cart/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home";

  static Key goToCartScreenButtonKey = UniqueKey();

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          key: goToCartScreenButtonKey,
          onPressed: () {
            GoRouter.of(context).goNamed(CartScreen.name);
          },
          child: const Text(
            "Go To Cart Screen",
          ),
        ),
      ),
    );
  }
}
