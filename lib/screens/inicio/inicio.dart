import 'package:delivery_app_customer/screens/inicio/fornecedores_list.dart';
import 'package:delivery_app_customer/screens/inicio/fornecedor_item.dart';
import 'package:delivery_app_customer/screens/inicio/product_item_list.dart';
import 'package:delivery_app_customer/screens/inicio/product_list.dart';
import 'package:flutter/material.dart';

import '../cart/cart_button.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final List<String> _categorias = ['Fornecedores', 'Produto'];

  final List<FornecedorItem> _todos = [
    FornecedorItem(
      title: 'CJ Lanches',
      categoria: 'Lanches',
      distancia: 5.5,
      tempoEntrega: 10,
      frete: 10,
      image: const AssetImage('./assets/images/user.png'),
      event: (context) {
        //
      },
    ),
    FornecedorItem(
      title: 'Faveri Carnes e Cia',
      categoria: 'Carnes',
      distancia: 7.2,
      tempoEntrega: 20,
      frete: 0,
      image: const AssetImage('./assets/images/user.png'),
      event: (context) {
        //
      },
    ),
  ];

  final List<ProductItemList> _myList = [
    ProductItemList(
      descricao: 'Baguncinha',
      valor: 15,
      categoria: 'Lanches',
      fornecedor: 'Bellatos',
      ingredientes: 'Pão, hamburguer, alface, tomate, ovo, milho, salsicha',
      disponivel: true,
      image: const AssetImage('./assets/images/baguncinha.png'),
      event: (context) {},
    ),
    ProductItemList(
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
    return DefaultTabController(
      child: Scaffold(
        floatingActionButton: const CartButton(),
        appBar: AppBar(
          title: const Text('Fornecedores'),
          bottom: TabBar(
            tabs: _categorias.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: TabBarView(children: [
          FornecedoresList(list: _todos),
          ProductList(list: _myList),
        ]),
      ),
      length: _categorias.length,
    );
  }
}
