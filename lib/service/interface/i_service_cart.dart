import 'package:delivery_app_customer/screens/cart/cart_item_list.dart';
import 'package:flutter/cupertino.dart';

abstract class IServiceCart extends ChangeNotifier {
  void remove(CartItemList itemCart);

  int quantidadeItens();
  List<CartItemList> cartListItem();
}
