import 'package:delivery_app_customer/dto/fornecedor.dart';
import 'package:delivery_app_customer/dto/item_produto.dart';
import 'package:delivery_app_customer/service/interface/i_service_cart.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ServiceCart extends ChangeNotifier implements IServiceCart {
  @override
  Fornecedor? defaultFornecedor;

  @override
  final List<ItemProduto> itensProduto = [];

  @override
  void limpaCarrinho() {
    itensProduto.clear();
  }

  ItemProduto? _findItemProdutoByProdutoId(int produtoId) {
    return itensProduto.firstWhereOrNull((e) => e.produto.id == produtoId);
  }

  @override
  void add(ItemProduto itemProduto) {
    ItemProduto? foundItemProduto = _findItemProdutoByProdutoId(itemProduto.produto.id);
    if (foundItemProduto == null) {
      itensProduto.add(itemProduto);
    } else {
      foundItemProduto.quantidade += 1;
    }
    notifyListeners();
  }

  @override
  void delete(ItemProduto itemProduto) {
    itensProduto.remove(itemProduto);
    notifyListeners();
  }

  @override
  double totalCart() {
    double vlrTotal = 0;
    for (var itemProduto in itensProduto) {
      vlrTotal += itemProduto.valor * itemProduto.quantidade;
    }
    return vlrTotal;
  }

  @override
  void remove(ItemProduto itemProduto) {
    var item = itensProduto.firstWhere((e) => e.produto.id == itemProduto.produto.id);
    if (item.quantidade > 1) {
      item.quantidade -= 1;
    }
    notifyListeners();
  }
}
