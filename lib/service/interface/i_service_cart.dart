import 'package:delivery_app_customer/dto/fornecedor.dart';
import 'package:delivery_app_customer/dto/item_produto.dart';
import 'package:flutter/material.dart';

abstract class IServiceCart extends ChangeNotifier {
  Fornecedor? defaultFornecedor;
  abstract final List<ItemProduto> itensProduto;
  void add(ItemProduto itemProduto);
  void delete(ItemProduto itemProduto);
  void remove(ItemProduto itemProduto);
  void limpaCarrinho();
  double totalCart();
}
