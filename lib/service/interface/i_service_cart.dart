import 'package:delivery_app_customer/dto/fornecedor.dart';
import 'package:delivery_app_customer/dto/item_produto.dart';
import 'package:flutter/cupertino.dart';

abstract class IServiceCart extends ChangeNotifier {
  Fornecedor? defaultFornecedor;
  abstract final List<ItemProduto> itensProduto;
  IServiceCart(this.defaultFornecedor);
  void add(ItemProduto itemProduto);
  void delete(ItemProduto itemProduto);
  void remove(ItemProduto itemProduto);
  double totalCart();
}
