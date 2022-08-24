import 'package:delivery_app_customer/dto/item_produto.dart';
import 'package:delivery_app_customer/service/interface/i_service_cart.dart';
import 'package:flutter/material.dart';

class ServiceCart extends ChangeNotifier implements IServiceCart {
  @override
  final List<ItemProduto> itensProduto = [];

  @override
  void add(ItemProduto itemProduto) {
    try {
      itensProduto.firstWhere((e) => e.produto.id == itemProduto.produto.id).quantidade += 1;
    }
    //
    catch (e) {
      itensProduto.add(itemProduto);
    }
    notifyListeners();
  }

  @override
  void remove(ItemProduto itemProduto) {
    itensProduto.remove(itemProduto);
    notifyListeners();
  }
}
