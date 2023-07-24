import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunrule2/controller/provider/provider.dart';
import 'package:sunrule2/view/home_screen/widget/item_card.dart';
import 'package:sunrule2/view/utils/utils.dart';
import '../../controller/controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final refresh = Provider.of<ShopProvider>(context).refresh();

    if (refresh == 'refresh') {
      setState(() {});
    }

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: myCart.isNotEmpty
          ? ListView.builder(
              // shrinkWrap: true,
              itemCount: myCart.length,
              itemBuilder: (context, index) {
                final filteredList = product
                    .where((item) => myCart.contains(item['id']))
                    .toList()
                  ..sort((a, b) => myCart
                      .indexOf(a['id'])
                      .compareTo(myCart.indexOf(b['id'])));
                final cartProduct = filteredList[index];
                return ItemCard(
                  product: cartProduct,
                  cart: true,
                );
              },
            )
          : Center(
              child: Image.asset('assets/cartempty.jpeg'),
            ),
    );
  }
}
