import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/cart/cart_screen.dart';
import 'package:go_router_test/home/home_screen.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: HomeScreen.name,
        path: "/",
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: CartScreen.name,
        path: "/cart",
        builder: (BuildContext context, GoRouterState state) {
          return const CartScreen();
        },
      ),
    ],
  );
}
