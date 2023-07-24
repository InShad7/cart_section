import 'package:flutter/material.dart';
import 'package:sunrule2/view/cart_screen/cart_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({super.key});

  final Size preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:const Text(
        'Nike',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            );
          },
        )
      ],
    );
  }
}
