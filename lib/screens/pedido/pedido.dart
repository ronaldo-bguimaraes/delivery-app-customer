import 'package:delivery_app_customer/screens/pedido/pedido_item.dart';
import 'package:delivery_app_customer/screens/pedido/pedido_list.dart';
import 'package:flutter/material.dart';

class Pedido extends StatefulWidget {
  const Pedido({Key? key}) : super(key: key);

  @override
  State<Pedido> createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  final List<String> _loja = ['Fornecedores', 'Produto'];

  final List<PedidoItem> _todos = [
    PedidoItem(
      title: 'CJ Lanches',
      image: const AssetImage('./assets/images/user.png'),
      event: (context) {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus pedidos'),
        ),
        body: TabBarView(children: [
          PedidoList(list: _todos)
        ]),
      ),
      length: _todos.length,
    );
  }


  
}
  