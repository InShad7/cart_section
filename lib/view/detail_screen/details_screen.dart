import 'package:flutter/material.dart';
import 'package:sunrule2/view/home_screen/widget/item_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, this.product});
  final product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [ItemCard( product: product)]),
    );
  }
}
