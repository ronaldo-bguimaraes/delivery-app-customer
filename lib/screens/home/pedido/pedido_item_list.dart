import 'package:delivery_app_customer/dto/item_produto.dart';
import 'package:delivery_app_customer/dto/venda.dart';
import 'package:flutter/material.dart';

class PedidoItemList {
  final DateTime dataVenda;
  final List<ItemProduto> itensProduto;
  final void Function(BuildContext) event;

  const PedidoItemList({
    required this.dataVenda,
    required this.itensProduto,
    required this.event,
  });

  factory PedidoItemList.fromVenda(Venda venda) {
    return PedidoItemList(
      dataVenda: venda.dataVenda,
      itensProduto: venda.itensProduto,
      event: (ctx) {
        //
      },
    );
  }
}
