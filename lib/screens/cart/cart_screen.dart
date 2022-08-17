import 'package:delivery_app_customer/screens/cart/body_cart.dart';
import 'package:delivery_app_customer/screens/cart/cart_item_list.dart';
import 'package:delivery_app_customer/service/interface/i_service_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../inicio/product_item_list.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IServiceCart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Meu Carrinho"),
          actions: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                "${cart.quantidadeItens()} itens",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
        body: BodyCart(),
      );
    });
  }
}
