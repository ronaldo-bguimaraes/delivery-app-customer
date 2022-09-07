import 'package:delivery_app_customer/dto/item_produto.dart';
import 'package:delivery_app_customer/dto/produto.dart';
import 'package:delivery_app_customer/screens/cart/cart_screen.dart';
import 'package:delivery_app_customer/service/interface/i_service_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItemList {
  final String descricao;
  final double valor;
  final String fornecedor;
  final String ingredientes;
  final bool disponivel;
  final String categoria;
  final ImageProvider<Object> image;
  final void Function(BuildContext) event;

  const ProductItemList({
    required this.descricao,
    required this.valor,
    required this.fornecedor,
    required this.ingredientes,
    required this.disponivel,
    required this.categoria,
    required this.image,
    required this.event,
  });

  factory ProductItemList.fromProduto(Produto produto) {
    return ProductItemList(
      descricao: produto.descricao,
      valor: produto.valor,
      fornecedor: produto.fornecedor.razaoSocial,
      ingredientes: produto.ingredientes,
      disponivel: produto.disponivel,
      categoria: '',
      image: const AssetImage('./assets/images/produto.png'),
      event: (ctx) {
        final itemProduto = ItemProduto.fromProduto(produto);
        ctx.read<IServiceCart>().add(itemProduto);
        //
        Navigator.of(ctx).pushNamed(CartScreen.routeName);
      },
    );
  }
}
