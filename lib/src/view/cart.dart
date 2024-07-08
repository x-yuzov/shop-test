import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, this.title = ''});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Корзина'),
        ),
        body: const Center(child: Text('В разработке...')));
  }
}
