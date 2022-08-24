import 'package:delivery_app_customer/screens/cart/cart_item_list.dart';
import 'package:delivery_app_customer/service/interface/i_service_cart.dart';
import 'package:flutter/material.dart';

class ServiceCart extends ChangeNotifier implements IServiceCart {
  final List<CartItemList> _myList = [
    CartItemList(
      descricao: 'Baguncinha',
      valor: 15,
      categoria: 'Lanches',
      fornecedor: 'Bellatos',
      ingredientes: 'Pão, hamburguer, alface, tomate, ovo, milho, salsicha',
      disponivel: true,
      image: const AssetImage('./assets/images/baguncinha.png'),
      event: (context) {
        //
      },
    ),
    CartItemList(
      descricao: 'X-Tudo',
      valor: 25,
      categoria: 'Lanches',
      fornecedor: 'CJ Lanches',
      ingredientes: 'Pão, hamburguer, alface, tomate, ovo, milho, salsicha, bacon, cheddar',
      disponivel: true,
      image: const AssetImage('./assets/images/x-tudo.png'),
      event: (context) {
        //
      },
    ),
  ];

  @override
  void remove(CartItemList itemCart) {
    _myList.remove(itemCart);
    notifyListeners();
  }

  @override
  int quantidadeItens() {
    return _myList.length;
  }

  @override
  List<CartItemList> cartListItem() {
    return _myList;
  }
}
