import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunrule2/controller/controller.dart';
import 'package:sunrule2/controller/provider/provider.dart';
import 'package:sunrule2/view/detail_screen/details_screen.dart';
import 'package:sunrule2/view/utils/utils.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {super.key, this.home = false, this.cart = false, this.product});

  final home;
  final cart;
  final product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: white, border: Border.all(width: 1, color: grey2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(
              onTap: () {
                home
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(product: product),
                        ),
                      )
                    : null;
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                height: cart ? mHeight! / 9 : mHeight! / 5,
                width: mWidth! / 2.5,
                color: white,
                child: Image.network(
                  product['image'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Text(
            product['name'],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: mHeight! / 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: mHeight! / 30,
                  width: mWidth! / 9,
                  color: yellow,
                  child: Center(
                    child: Text(
                      product['rate'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Provider.of<ShopProvider>(context)
                    .showCounterOrBtn(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddCartBtn extends StatelessWidget {
  const AddCartBtn({super.key, required this.product});

  final product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ShopProvider>(context, listen: false)
            .addToCart(product: product);
      },
      child: Container(
        height: mHeight! / 30,
        width: mWidth! / 5,
        color: blue,
        child: Center(
          child: Text(
            'Add Cart',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}
