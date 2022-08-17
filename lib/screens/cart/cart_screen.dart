import 'package:delivery_app_customer/screens/cart/body_cart.dart';
import 'package:delivery_app_customer/screens/cart/cart_item_list.dart';
import 'package:flutter/material.dart';

import '../inicio/product_item_list.dart';

class CartScreen extends StatelessWidget {
  final List<CartItemList> _myList = [
    CartItemList(
      descricao: 'Baguncinha',
      valor: 15,
      categoria: 'Lanches',
      fornecedor: 'Bellatos',
      ingredientes: 'Pão, hamburguer, alface, tomate, ovo, milho, salsicha',
      disponivel: true,
      image: const AssetImage('./assets/images/baguncinha.png'),
      event: (context) {},
    ),
    CartItemList(
      descricao: 'X-Tudo',
      valor: 25,
      categoria: 'Lanches',
      fornecedor: 'CJ Lanches',
      ingredientes: 'Pão, hamburguer, alface, tomate, ovo, milho, salsicha, bacon, cheddar',
      disponivel: true,
      image: const AssetImage('./assets/images/x-tudo.png'),
      event: (context) {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Carrinho"),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 8.0),
            child: Text(
              "${_myList.length} itens",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
      body: BodyCart(list: _myList),
    );
  }
}
