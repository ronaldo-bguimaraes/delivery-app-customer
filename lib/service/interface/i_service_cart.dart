import 'package:delivery_app_customer/dto/item_produto.dart';
import 'package:flutter/cupertino.dart';

abstract class IServiceCart extends ChangeNotifier {
  abstract final List<ItemProduto> itensProduto;
  void add(ItemProduto itemProduto);
  void remove(ItemProduto itemProduto);
}
