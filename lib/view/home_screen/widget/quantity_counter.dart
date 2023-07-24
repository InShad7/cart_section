import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunrule2/controller/provider/provider.dart';
import 'package:sunrule2/view/utils/utils.dart';

class QuantityCounter extends StatelessWidget {
  const QuantityCounter({super.key, this.product});
  final product;

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<ShopProvider>(context);
    shopProvider.getCount(product: product);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            shopProvider.decrementQuantity(product: product);
          },
          icon: const Icon(Icons.remove),
        ),
        Container(
          height: 23,
          width: 23,
          decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              '${shopProvider.count}',
              style: TextStyle(fontSize: 15, color: white),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            shopProvider.incrementQuantity(product: product);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
