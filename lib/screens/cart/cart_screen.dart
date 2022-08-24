import 'package:delivery_app_customer/screens/cart/body_cart.dart';
import 'package:delivery_app_customer/service/interface/i_service_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart-screen';

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
          title: const Text("Meu Carrinho"),
          actions: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                "${cart.itensProduto.length} itens",
                style: const TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
        body: const BodyCart(),
      );
    });
  }
}
