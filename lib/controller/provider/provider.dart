import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sunrule2/controller/controller.dart';
import 'package:sunrule2/model/model.dart';
import 'package:sunrule2/view/home_screen/widget/item_card.dart';
import 'package:sunrule2/view/utils/utils.dart';
import '../../view/home_screen/widget/quantity_counter.dart';

class ShopProvider extends ChangeNotifier {
  int count = 0;

  void getCount({product}) {
    if (myCart.contains(product['id'])) {
      int index = myCart.indexOf(product['id']);
      count = myCount[index];
    }
  }

  void incrementQuantity({product}) {
    if (myCart.contains(product['id'])) {
      int index = myCart.indexOf(product['id']);
      count = myCount[index];
      if (count == 10) {
        Fluttertoast.showToast(
          msg: 'Limit exceeded',
          backgroundColor: red,
        );
      } else if (count >= 0 && count < 10) {
        count++;
        myCount[index]++;
        Cart addCart = Cart(count: myCount, product: myCart);
        addCart.addCartToFirebase();
      }
    } else {
      count++;
      myCart.add(product['id']);
      myCount.add(1);
      Cart addCart = Cart(count: myCount, product: myCart);
      addCart.addCartToFirebase();
    }
    notifyListeners();
  }

  void decrementQuantity({product}) {
    if (myCart.contains(product['id'])) {
      int index = myCart.indexOf(product['id']);
      int count = myCount[index];

      if (count > 0 && count <= 10) {
        count--;
        myCount[index] = count;

        if (count == 0) {
          myCart.removeAt(index);
          myCount.removeAt(index);
          notifyListeners();
          Fluttertoast.showToast(
            msg: 'Removed',
            backgroundColor: red,
          );
        }
      }

      Cart addCart = Cart(count: myCount, product: myCart);
      addCart.addCartToFirebase();

      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  refresh() {
    if (myCart.isEmpty) {
      return 'refresh';
    }
  }

  showCounterOrBtn({product}) {
    if (myCart.contains(product['id'])) {
      return QuantityCounter(product: product);
    } else {
      return AddCartBtn(product: product);
    }
  }

  void addToCart({product}) {
    if (myCart.contains(product['id'])) {
      Fluttertoast.showToast(msg: 'already in the cart');
    } else {
      myCart.add(product['id']);
      myCount.add(1);
      Cart add = Cart(count: myCount, product: myCart);
      add.addCartToFirebase();
      Fluttertoast.showToast(msg: 'Added to cart');
    }
    notifyListeners();
  }
}
