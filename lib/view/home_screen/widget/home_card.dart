import 'package:flutter/material.dart';
import 'package:sunrule2/controller/controller.dart';
import 'package:sunrule2/view/home_screen/widget/item_card.dart';

class HomeCards extends StatelessWidget {
  const HomeCards({super.key});

  @override
  Widget build(BuildContext context) {
    getCart();
    return StreamBuilder(
      stream: getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error fetching data"),
          );
        } else if (snapshot.hasData) {
          final data = snapshot.data;
          product = data;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: (mHeight! > 925) ? 0.74 : 0.68,
            ),
            itemCount: 6,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final product = data[index];

              return ItemCard(product: product, home: true);
            },
          );
        } else {
          return const Center(
            child: Text("Can't fetch Data"),
          );
        }
      },
    );
  }
}
