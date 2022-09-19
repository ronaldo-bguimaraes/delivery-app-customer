import 'package:delivery_app_customer/screens/home/inicio/finalizar_pedido/finalizar_pedido.dart';
import 'package:delivery_app_customer/screens/home/pedido/pedido_list.dart';
import 'package:delivery_app_customer/screens/user/check_sign_in.dart';
import 'package:delivery_app_customer/provider/provider_dependencies.dart';
import 'package:delivery_app_customer/screens/home/inicio/cart/cart_screen.dart';
import 'package:delivery_app_customer/screens/home/home.dart';
import 'package:delivery_app_customer/screens/perfil/cartao.dart';
import 'package:delivery_app_customer/screens/perfil/minhas_formas_pagamento.dart';
import 'package:delivery_app_customer/screens/user/user_sign_email.dart';
import 'package:delivery_app_customer/screens/user/user_sign_in.dart';
import 'package:delivery_app_customer/screens/user/user_sign_up.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    const ProviderDependencies(
      child: Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Cliente',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: CheckSignIn.routeName,
      routes: {
        CheckSignIn.routeName: (context) => const CheckSignIn(),
        UserSignIn.routeName: (context) => const UserSignIn(),
        UserSignInEmail.routeName: (context) => const UserSignInEmail(),
        UserSignUp.routeName: (context) => const UserSignUp(),
        MinhasFormasPagamento.routeName: (context) => const MinhasFormasPagamento(),
        CartScreen.routeName: (context) => const CartScreen(),
        Cartao.routeName: (context) => const Cartao(),
        Home.routeName: (context) => const Home(),
        FinalizarPedido.routeName: (context) => const FinalizarPedido(),
        PedidoList.routeName: (context) => const PedidoList(),
      },
    );
  }
}
